let medicationFormCount = 1;

function addForm() {
  const original = document.getElementById("medications"); // 最初の薬の情報フォームを取得
  const cloned = original.cloneNode(true);
  // クローンされた要素内の各フォーム要素に一意のname属性を設定
  cloned.querySelectorAll('input, textarea').forEach((element) => {
    const name = element.getAttribute("name");
    if (name) {
      const newName = name.replace(/\[\d+\]/g, `[${medicationFormCount}]`);
      element.setAttribute("name", newName);
      element.value = ''; // フォームをクリア
    }
  });
  // クローンをDOMに追加
  original.parentNode.insertBefore(cloned, original.nextSibling);
  medicationFormCount++; // カウンターをインクリメント

// 新しい削除ボタンを追加
const newRemoveButton = document.createElement("button");
newRemoveButton.type = "button";
newRemoveButton.textContent = "削除する";
newRemoveButton.classList.add("remove_form");
newRemoveButton.addEventListener("click", () => removeForm(cloned));
cloned.appendChild(newRemoveButton);
}

function removeForm(form) {
  form.remove();
}

document.addEventListener('DOMContentLoaded', () => {
  document.getElementById("add_form").addEventListener("click", addForm);

  if (document.querySelectorAll('.medication-fields').length > 1) {
    const removeButtons = document.querySelectorAll(".remove_form");
    removeButtons.forEach((button) => {
      button.addEventListener("click", () => {
        removeForm(button.closest(".medication-fields"));
      });
    })
  } else {
    return;
  }
});


