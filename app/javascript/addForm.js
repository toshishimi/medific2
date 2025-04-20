let medicationFormCount = 1;

/**
 * フォーム追加
 */
function addForm() {
  // 最初の薬の情報フォームを取得
  const original = document.getElementById("medication0"); 
  // クローン作成
  const cloned = original.cloneNode(true);
  // liのidを変更
  cloned.id = `medication${medicationFormCount}`;
  // クローンの削除ボタンを削除
  const editDeleteButton = cloned.querySelector(".btn-danger"); 
  if (editDeleteButton) {
    editDeleteButton.remove();
  }
  // クローンされた要素内の各フォーム要素に一意のname属性を設定
  cloned.querySelectorAll('input, textarea').forEach((element) => {
    const name = element.getAttribute("name");
    if (name) {
      const newName = name.replace(/\[\d+\]/g, `[${medicationFormCount}]`);
      element.setAttribute("name", newName);
      element.value = ''; // フォームをクリア
    }
  });
  // クローンを追加
  document.getElementById("medication-list").appendChild(cloned);
  // カウンターをインクリメント
  medicationFormCount++; 

  // 削除ボタンを追加
  addDeleteButton(cloned);
};

/**
 * 削除ボタン追加
 *
 * @param {*} cloned クローン
 */
function addDeleteButton(cloned) {
  const deleteButton = document.createElement("button");
  deleteButton.textContent = "削除";
  deleteButton.className = "btn btn-danger";
  deleteButton.addEventListener("click", () => {
    const deleteTarget = deleteButton.closest("li");
    document.getElementById("medication-list").removeChild(deleteTarget);
  });
  cloned.appendChild(deleteButton);
};

document.addEventListener('DOMContentLoaded', () => {
  document.getElementById("add-button")?.addEventListener("click", addForm);
});