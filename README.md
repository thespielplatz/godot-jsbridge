# godot-jsbridge
Technical Spike for Godot to talk to Javascript

### Could Do's
- Get the HTML Shell Template working for scaling
- Speed Update

## Run the WebExport
- Goto the export dir
- Run 'python -m http.server', it fires a small webserver at localhost:8000
- Open http://localhost:8000/export.html

## Communication
The Bridge is defined in the export/egb.js. The idea is to have one input and output array that is monitored and pushed by Godot and Javascript.

Godot checks the EGB.input array for new elements and shifts the first one every 1/20 seconds

Godot pushed into the EGB.output array

Two "actions" are defined to change the color of the white box. The Spike is triggered by the following 2x strings:
- c|red
- c|green

## Infos
- Wait "some time" till the whole project is loaded ... you can see this in the JS Console
- I think the regular process calls slow the javascript in the browser ...
- JS Array & Objects are not working (they should acc. to docs)
- The JS Context is the "godot context" acc. to docs, whereever this is. It can be set to eval on the global context