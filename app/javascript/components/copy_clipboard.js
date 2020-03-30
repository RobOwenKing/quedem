function initLinkCopy() {
  const copyButton = document.getElementById("copy-button");
  if (copyButton) {
    copyButton.addEventListener('click', copyToClipboard);
    copyButton.addEventListener('mouseout', resetCopyText)
  }
}

function copyToClipboard() {
  var copyText = document.getElementById("myInput");
  copyText.select();
  copyText.setSelectionRange(0, 99999);
  document.execCommand("copy");

  var tooltip = document.getElementById("myTooltip");
  tooltip.innerHTML = "Copied: " + copyText.value;
}

function resetCopyText() {
  var tooltip = document.getElementById("myTooltip");
  tooltip.innerHTML = "Copy to clipboard";
}

export { initLinkCopy }
