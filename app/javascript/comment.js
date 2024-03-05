document.addEventListener("DOMContentLoaded", function() {
  // ボタンとコメント入力欄の要素を取得
  const commentButtons = document.querySelectorAll(".comment-button");
  const commentInput = document.getElementById("commentInput");

  // ボタンをクリックしていないことを変数で定義
  let templateButtonClicked = false;

  // ボタンの繰り返し処理
  commentButtons.forEach(function(commentButton){
    // ボタンが押されたときのイベント発火
    commentButton.addEventListener("click", function(event) {
      // ボタンをクリックしたときにコメント欄がテンプレートで埋められているかで条件分岐
      if (!templateButtonClicked) {
      //ボタンが「送信」のイベントを発火しないようにする
      event.preventDefault();

      // テンプレートをコメント入力欄に表示
      commentInput.value = this.dataset.template;

      // ボタンがクリックされたことをフラグで記録
      templateButtonClicked = true;

      // リロードしなくても再度ボタンが押せるよう、フラグの記録をなくす
      templateButtonClicked = false;

      }
    });
  });

  
});
