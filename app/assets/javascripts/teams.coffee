$ ->
  member_num = $('.js-team_member').length
  $('#add_item_button').on 'click', ->
    input = '<div class="js-team_member" id="add_member_' +
    member_num +
    '">' +
    '<input placeholder="ID" type="text" name="team[members_attributes][' +
    member_num + '][target_id]" id="team_members_attributes_' + member_num + '_taget_id" required>' +
    '<input placeholder="職種" type="text" name="team[members_attributes][' +
    member_num + '][target_type]" id="team_members_attributes_' + member_num + '_target_type" required>' +
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
