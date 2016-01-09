require 'csv'
namespace :db do
  namespace :seed do
    def reset_pk(table_name)
      case ActiveRecord::Base.connection.adapter_name
      when 'SQLServer'
        ActiveRecord::Base.connection.execute "DBCC CHECKIDENT ('#{table_name}', RESEED, 1)"
      when 'SQLite'
        update_seq_sql = "UPDATE sqlite_sequence SET seq = 0 WHERE name = '#{table_name}';"
        ActiveRecord::Base.connection.execute(update_seq_sql)
      when 'Mysql'
        update_seq_sql = "ALTER TABLE '#{table_name}' AUTO_INCREMENT = 1;"
        ActiveRecord::Base.connection.execute(update_seq_sql)
      when 'PostgreSQL'
        ActiveRecord::Base.connection.reset_pk_sequence!(table_name)
      else
        raise "Task not implemented for this DB adapter"
      end
    end

    desc 'read data from csvs'
    task csv: :environment do
      csvs_dir  = "#{Rails.root}/db/csvs"
      csv_files = Dir.entries(csvs_dir).select { |f| f =~ /\.csv$/ }
      csv_files.each do |csv_file|
        table_name = File.basename(csv_file, '.csv')
        model      = table_name.classify.constantize

        csv  = CSV.read("#{csvs_dir}/#{csv_file}", headers: true, converters: :numeric)
        ActiveRecord::Base.transaction do
          model.delete_all
          reset_pk(table_name)
          csv.each do |row|
            validate_flag = true
            validate_flag = false if model == Team
            model.new(row.to_hash).save!(validate: validate_flag)
          end
        end
      end
    end
  end
end
