var Module = {
  noInitialRun: true,
};

async function submitHandler(e) {
  e.preventDefault();
  const file = document.getElementById('mainfile').files[0];
  if (!file) {
    alert('no file?!');
    return;
  }
  const fileArray = await file.arrayBuffer();
  FS.writeFile('/data.pdz', new Uint8Array(fileArray));
  callMain(['/main.lua', '/data.pdz', '/out.json']);
  const outputJsonArray = FS.readFile('/out.json');
  FS.unlink('/out.json');
  const outputBlob = new Blob([outputJsonArray], {'type': 'application/json'});
  const downloadLink = document.getElementById('downloadlink');
  downloadLink.style.display = '';
  downloadLink.href = URL.createObjectURL(outputBlob);
  downloadLink.download = 'out.json';
}

function loadHandler() {
  document.getElementById('mainform').onsubmit = submitHandler;
  startPreload();
}

async function startPreload() {
  const fileNames = ['main.lua', 'json.lua'];
  await Promise.all(fileNames.map(loadFile));
}

async function loadFile(fileName) {
  const fileFetch = await fetch(fileName);
  const fileArray = await fileFetch.arrayBuffer();
  FS.writeFile('/' + fileName, new Uint8Array(fileArray));
}

window.onload = loadHandler;
