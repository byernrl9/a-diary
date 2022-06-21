document.addEventListener('DOMContentLoaded', function(){
  // 新規投稿・編集ページのフォームを取得
  const diaryForm = document.getElementById('new_diary');
  // プレビューを表示するためのスペースを取得
  const previewList = document.getElementById('previews');
  // 新規投稿・編集ページのフォームがないならここで終了。「!」は論理否定演算子。
  if (!diaryForm) return null;
  console.log("preview.jsが読み込まれました");

  // input要素を取得
  const fileField = document.querySelector('input[type="file"][name="diary[image]"]');
  // input要素で値の変化が起きた際に呼び出される関数
  fileField.addEventListener('change', function(e){
    console.log("input要素で値の変化が起きました");
  });
});