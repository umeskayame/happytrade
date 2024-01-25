document.addEventListener("DOMContentLoaded", function() {
  // ボタンとコメント入力欄の要素を取得
  const showTemplateButton = document.getElementById("button");
  const commentInput = document.getElementById("commentInput");

  // ボタンをクリックしていないことを変数で定義
  let templateButtonClicked = false;

  // ボタンが押されたときのイベント発火
  showTemplateButton.addEventListener("click", function(event) {
    // ボタンをクリックしたときにコメント欄がテンプレートで埋められているかで条件分岐
    if (!templateButtonClicked) {
      //ボタンが「送信」のイベントを発火しないようにする
      event.preventDefault();

      // テンプレートを作成
      const template = "こんにちは。交換を希望しています。こちらのアイテムと交換いただくことは可能でしょうか。【ここにご自身のアイテム詳細ページのURLを入力してください。】";

      // テンプレートをコメント入力欄に表示
      commentInput.value = template;

      //ボタンがクリックされたことをフラグで記録
      templateButtonClicked = true;
    }
  });

  // コメントが投稿された場合のフラグをリセットして、再度テンプレートを呼び出せるようにする
  document.addEventListener("turbo:submit-end", function() {
    templateButtonClicked = false;
  });
});
