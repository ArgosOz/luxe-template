package ui;

import luxe.Scene;

import mint.Control;
import mint.render.luxe.LuxeMintRender;

import ui.render.UIButtonSimple;
import ui.render.UIPixelFontLabel;

class UIRendering extends LuxeMintRender 
{
    public var scene(default, null):Scene;

    public function new(?options:luxe.options.RenderProperties)
    {
        super(options);

        scene = new Scene('ui_scene');
    }

    override function get<T:Control, T1>(type:Class<T>, control:T):T1 
    {
        return cast switch(type) 
        {
            case mint.Canvas:       new mint.render.luxe.Canvas(this, cast control);
            // case mint.Label:       new mint.render.luxe.Label(this, cast control);
            // case mint.Button:      new mint.render.luxe.Button(this, cast control);
            case mint.Image:        new mint.render.luxe.Image(this, cast control);
            case mint.List:         new mint.render.luxe.List(this, cast control);
            case mint.Scroll:       new mint.render.luxe.Scroll(this, cast control);
            case mint.Panel:        new mint.render.luxe.Panel(this, cast control);
            case mint.Checkbox:     new mint.render.luxe.Checkbox(this, cast control);
            case mint.Window:       new mint.render.luxe.Window(this, cast control);
            case mint.TextEdit:     new mint.render.luxe.TextEdit(this, cast control);
            case mint.Dropdown:     new mint.render.luxe.Dropdown(this, cast control);            
            case mint.Slider:       new mint.render.luxe.Slider(this, cast control);
            case mint.Progress:     new mint.render.luxe.Progress(this, cast control);
            // Custom
            case mint.Button:       new UIButtonSimple(this, cast control);           
            case mint.Label:        new UIPixelFontLabel(this, cast control);                         
            case _:                null;
        }
    }
}
