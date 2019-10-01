const { app, BrowserWindow } = require('electron')
const electron = require('electron')


function createWindow () {
  // Crea la ventana del navegador.
  let win = new BrowserWindow({
    width: 930,
    height: 650,
    webPreferences: {
      nodeIntegration: true,
      devTools: true
    },
    frame: false
  })

  // and load the index.html of the app.
  win.loadFile('index.html')
}

app.on('ready', createWindow)
