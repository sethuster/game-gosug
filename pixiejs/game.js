//Aliases
var Container = PIXI.Container,
autoDetectRenderer = PIXI.autoDetectRenderer,
loader = PIXI.loader,
resources = PIXI.loader.resources
Sprite = PIXI.Sprite

//Create a container object called the `stage`
var stage = new Container(),
renderer = autoDetectRenderer(1024,768);
//Add the canvas to the HTML document
document.body.appendChild(renderer.view);

//Load some game images
loader.add("images/starfighter.bmp").load(setup)

function setup(){
  var ship = new Sprite(
    loader.resources["images/starfighter.bmp"].texture
  )
  ship.position.set(96, 96)

  stage.addChild(ship)

  //Tell the `renderer` to `render` the `stage`
  renderer.autoResize = true;
  renderer.view.style.position = "absolute";
  renderer.view.style.display = "block";
  renderer.autoResize = true;
  renderer.resize(window.innerWidth, window.innerHeight);
  renderer.render(stage);
}
