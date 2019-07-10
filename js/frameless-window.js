const {BrowserWindow} = require('electron').remote
const newWindowBtn = document.getElementById('frameless-window')
const { remote } = require('electron');
const path = require('path')

newWindowBtn.addEventListener('click', (event) => {
  const modalPath = path.join('file://', __dirname, '../sections/windows/participantes.html')
  let win = new BrowserWindow({
                frame: false, 
                parent: remote.getCurrentWindow(), 
                modal: true,
                width: 500,
                height: 550
                })

  win.on('close', () => { win = null })
  win.loadURL(modalPath)
  win.show()

})
