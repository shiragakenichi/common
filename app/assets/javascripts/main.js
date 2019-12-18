$(function(){
  /** GOOD */
  $(document).on('click', '.user-info', function(){
    $('.follow-icon') .append(

      '<div data-radium="true" style="box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 10px; position: absolute; top: 48px; right: 0px; min-width: 165px; background-color: rgb(255, 255, 255); border-radius: 2px;"><a href="/dashboard" data-radium="true" style="transition: all 0.3s ease 0s; line-height: 1.7; padding: 14px 20px; color: rgb(43, 84, 106); display: block;">ダッシュボード</a><a href="/settings" data-radium="true" style="transition: all 0.3s ease 0s; line-height: 1.7; padding: 14px 20px; color: rgb(43, 84, 106); display: block;">アカウント設定</a><a href="/signout" data-radium="true" style="transition: all 0.3s ease 0s; line-height: 1.7; padding: 14px 20px; color: rgb(43, 84, 106); display: block;">ログアウト</a></div>'
    )
  });
});