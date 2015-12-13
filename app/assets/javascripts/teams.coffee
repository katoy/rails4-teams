$ ->
  member_num = $('.js-team_member').length
  $('#add_item_button').on 'click', ->
    input = '<div class="js-team_member" id="add_member_' +
    member_num +
    '">' +
    '<input placeholder="名前" type="text" name="team[members_attributes][' +
    member_num + '][name]" id="team_members_attributes_' + member_num + '_name" required>' +
    '<input placeholder="年齢" type="text" name="team[members_attributes][' +
    member_num + '][age]" id="team_members_attributes_' + member_num + '_age" required>' +
    '<input placeholder="メールアドレス" type="text" name="team[members_attributes][' +
    member_num + '][mail]" id="team_members_attributes_' + member_num + '_mail" required>' +
    '<button class="member_delete" data-id="' + member_num + '">' + '削除' + '</button>' + '</div>'
    $('#team_members_box').append input
    member_num++
    return

  $('#team_members_box').on 'click', '.member_delete', ->
    inputId = $(this).data('id')
    defaultData = $(this).data('default')
    if defaultData == 'default'
      $(this).prev().prop 'checked', true
      $('#add_member_' + inputId).hide()
    else
      $('#add_member_' + inputId).remove()
    return
  return
