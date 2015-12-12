$ ->
  member_num = $('.js-team_member').length
  $('#add_item_button').on 'click', ->
    input = '<div class="js-team_member" id="add_member_' +
    member_num +
    '">' +
    '<input placeholder="メンバーの名前を入力して下さい" type="text" name="team[members_attributes][' +
    member_num + '][name]" id="team_members_attributes_' + member_num + '_name" required>' +
    '<input placeholder="メンバーの年齢を入力して下さい" type="text" name="team[members_attributes][' +
    member_num + '][age]" id="team_members_attributes_' + member_num + '_age" required>' +
    '<input placeholder="メンバーのメールアドレスを入力して下さい" type="text" name="team[members_attributes][' +
    member_num + '][mail]" id="team_members_attributes_' + member_num + '_mail" required>' +
    '<span data-id="' + member_num + '">' + '削除' + '</span>' + '</div>'
    $('#team_members_box').append input
    member_num++
    return
  return
