$(function(){
  /** GOOD */
  $(document).on('click', '.user-info', function(){
    $('.follow-icon') .append(

      '<div data-radium="true" style="box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 10px; position: absolute; top: 48px; right: 0px; min-width: 165px; background-color: rgb(255, 255, 255); border-radius: 2px;"><a href="/dashboard" data-radium="true" style="transition: all 0.3s ease 0s; line-height: 1.7; padding: 14px 20px; color: rgb(43, 84, 106); display: block;">ダッシュボード</a><a href="/settings" data-radium="true" style="transition: all 0.3s ease 0s; line-height: 1.7; padding: 14px 20px; color: rgb(43, 84, 106); display: block;">アカウント設定</a><a href="/users/sign_out" data-radium="true" style="transition: all 0.3s ease 0s; line-height: 1.7; padding: 14px 20px; color: rgb(43, 84, 106); display: block;">ログアウト</a></div>'
    )
  });
  $(document).off('click', '.user-info', function(){})
});

$(function(){

  $(document).on('click', '.fas.fa-user-friends', function(){
    $('.follow-icon') .append(
      '<div data-radium="true" style="box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 10px; position: absolute; top: 56px; right: 6px; min-width: 360px; background-color: rgb(255, 255, 255); border-radius: 2px;"><div class="fr-dd-triangle" data-radium="true" style="transition: all 0.3s ease 0s; line-height: 1.7; padding: 14px 20px; color: rgb(43, 84, 106); display: block;"></div><div data-radium="true" style="transition: all 0.3s ease 0s; line-height: 0.7; padding: 14px 20px; color: rgb(43, 84, 106); display: block; height: 36px; border-bottom: 1px solid rgba(221, 223, 227, 0.3); background-color: rgba(250, 251, 251, 0.7);">友達リクエスト（全0件）</div><div data-radium="true" style="transition: all 0.3s ease 0s; line-height: 1.7; padding: 14px 20px; color: rgb(43, 84, 106); display: block;"><div class="fr-dd-wanko" data-radium="true"><div class="fr-dd-wanko--message" data-radium="true"><div data-radium="true"><p data-radium="true"><span>Progate</span>で</p><p>友達とつながろう！</p><img src="https://d2aj9sy12tbpym.cloudfront.net/javascripts/dist/assets/ninjawanko_friends-bb81106bafa37ecf68f83ba9b67f61db.svg"><div>早速お友達を検索しましょう。</div></div></div><a class="fr-dd-wanko--search" href="/users/931267/friends#search" data-radium="true"><button data-radium="true"><i class="fa fa-search u-mr10"></i>友達を検索する</button></a></div></div><div data-radium="true" style="transition: all 0.3s ease 0s; line-height: 0.7; padding: 14px 20px; color: rgb(43, 84, 106); display: block; height: 36px; border-top: 1px solid rgba(221, 223, 227, 0.3); text-align: center; background-color: rgba(250, 251, 251, 0.7);"><div class="fr-dd-link"><a href="/users/931267/friends#friends">友達一覧をみる</a></div></div></div>'
    )
  });

})

$(function(){

  $(document).on('click', '.fas.fa-bell', function(){
    $('.follow-icon') .append(
      '<div data-radium="true" style="box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 10px; position: absolute; top: 48px; right: 0px; min-width: 350px; background-color: rgb(255, 255, 255); border-radius: 2px; max-height: 90vh; overflow-y: scroll;"><div data-radium="true" style="transition: all 0.3s ease 0s; line-height: 0.3; padding: 14px 20px; color: rgb(43, 84, 106); display: block; border-bottom: 1px solid rgba(221, 223, 227, 0.3); border-top: 1px solid rgba(221, 223, 227, 0.3); background-color: rgba(250, 251, 251, 0.7);">メッセージ</div><a href="/message" data-radium="true" style="transition: all 0.3s ease 0s; line-height: 1.7; padding: 14px 20px; color: rgb(43, 84, 106); display: block;"><div class="u-navy">プログラミングを学ぶあなたへ</div></a><div data-radium="true" style="transition: all 0.3s ease 0s; line-height: 0.3; padding: 14px 20px; color: rgb(43, 84, 106); display: block; border-bottom: 1px solid rgba(221, 223, 227, 0.3); border-top: 1px solid rgba(221, 223, 227, 0.3); background-color: rgba(250, 251, 251, 0.7);">お知らせ</div><div data-radium="true" style="transition: all 0.3s ease 0s; line-height: 1.7; padding: 14px 20px; color: rgb(43, 84, 106); display: block;"><a href="https://prog-8.com/blogs/closing-swift-lesson"><div><div class="u-navy">2019年10月31日をもちましてSwiftコースを公開終了いたします。</div><time class="u-tb--x-small u-gray" datetime="2019-09-26T08:31:50.000Z" title="2019-09-26T17:31:50.000+09:00">約 3 ヶ月前</time></div></a></div><div data-radium="true" style="transition: all 0.3s ease 0s; line-height: 1.7; padding: 14px 20px; color: rgb(43, 84, 106); display: block;"><a href="https://prog-8.com/success_stories/riida"><div><div class="u-navy">Progate Success Storiesを公開！英単語アプリ「mikan」でグロースハッカーとして活躍中の飯田さん。就活を避けてプログラミングの勉強を始めたものの、一度は挫折してしまったそう。業務でSQLを使いこなせるまでの道のりと、具体的なプロダクト改善事例を聞きました。</div><time class="u-tb--x-small u-gray" datetime="2019-08-28T02:23:00.000Z" title="2019-08-28T11:23:00.000+09:00">約 4 ヶ月前</time></div></a></div></div>'
    )
  });
})
