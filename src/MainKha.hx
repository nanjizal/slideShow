package;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.Image;
import kha.Color;
import kha.Assets;
import kha.input.Keyboard;
import kha.input.Mouse;
import kha.input.KeyCode;
import tweenx909.TweenX;
import tweenx909.EaseX;
import haxe.Http;
import js.Browser;
import js.html.AnchorElement;

class ImageWrapper {
    public static var count: Int = 0;
    public var alpha: Float = 0.;
    public var image: Image;
    public var id: Int;
    public function new( image_: Image ){
        image = image_;
        id = count;
        count++;
    }
    public function show( delay: Float ){
        TweenX.to( this, { alpha :1.0 }).delay( delay ).time( .75 ).ease( EaseX.quadIn ).ease( EaseX.quadIn );
    }
    public function hide( delay: Float ){
        TweenX.to( this, { alpha :0.0 }).delay( delay ).time( .55 ).ease( EaseX.quadOut );
    }
}
class MainKha {
    var imageCount: Int = 0;
    var imageTotal: Int;
    var images: Array<ImageWrapper>;
    var links: Array<String>;
    public function new() {
        Assets.loadEverything(loadAll);
    }
    function loadAll(){
        var imgs = Assets.images;
        //new ImageWrapper( imgs.monkeyImage ) 'https://rawgit.com/nanjizal/Monkey/master/build/html5/index.html'
        
        images = [ new ImageWrapper( imgs.makingShapesJustin )
                 , new ImageWrapper( imgs.twoDimages )
                 , new ImageWrapper( imgs.generatingCurves )
                 , new ImageWrapper( imgs.lsystem ) /* first animation */
                 , new ImageWrapper( imgs.Lsystem2 )
                 , new ImageWrapper( imgs.bezierChain )
                 , new ImageWrapper( imgs.picker )
                 , new ImageWrapper( imgs.clock )
                 , new ImageWrapper( imgs.polyKDivtastic )
                 , new ImageWrapper( imgs.TwoLinesWithLines ) 
                 , new ImageWrapper( imgs.justTriangles )
                 , new ImageWrapper( imgs.jigsawXimage )
                 , new ImageWrapper( imgs.mandelbrotImage )
                 , new ImageWrapper( imgs.mandelbrotImage )
                 , new ImageWrapper( imgs.luxeTriangle )
                 , new ImageWrapper( imgs.khaTriangle )
                 , new ImageWrapper( imgs.abcdefg )
                 , new ImageWrapper( imgs.lettersSimple )
                 , new ImageWrapper( imgs.justDrawingKiwi )
                 , new ImageWrapper( imgs.zeal )
                 , new ImageWrapper( imgs.shaderDiagram )
                 , new ImageWrapper( imgs.setupWebgl )
                 , new ImageWrapper( imgs.javaSwingCircleExample )
                 , new ImageWrapper( imgs.JFrame )
                 , new ImageWrapper( imgs.Jpanel )
                 , new ImageWrapper( imgs.swingCircle )
                 , new ImageWrapper( imgs.settingupSVG )
                 , new ImageWrapper( imgs.hxDaedalusImg )
                 , new ImageWrapper( imgs.ruppert)
                 , new ImageWrapper( imgs.spiro )
                 ];
        links = [ ''
                , ''
                , ''
                , 'https://rawgit.com/nanjizal/L-System/master/bin/webIteration/index.html'
                , 'https://rawgit.com/nanjizal/L-System/master/bin/web/index.html'
                , 'https://github.com/nanjizal/divtasticDemo/blob/master/README.md#bezier-movement'
                , 'https://rawgit.com/nanjizal/divtasticDemo/master/color_picker/ColorPicker.html'
                , 'https://rawgit.com/nanjizal/divtasticDemo/master/div_clock/DivClock.html'
                , 'https://rawgit.com/nanjizal/hxPolyK/master/polyKdivs/index.html'
                , 'https://rawgit.com/nanjizal/justTrianglesKhaG2/master/build/index.html'
                , 'https://rawgit.com/nanjizal/JustTrianglesKha4/master/build/html5/index.html'
                , 'https://rawgit.com/nanjizal/JigsawX/master/bin/JigsawDivtastic.html'
                , 'https://rawgit.com/nanjizal/Mandelbrot/master/binLuxe/web/index.html'
                , 'https://rawgit.com/nanjizal/Mandelbrot/master/build/html5/index.html'
                , 'https://rawgit.com/nanjizal/ATriangle/master/LuxeEmpty/bin/web/index.html'
                , 'https://rawgit.com/nanjizal/ATriangle/master/khaEmpty/build/html5/index.html'
                , 'https://rawgit.com/nanjizal/Letters/master/web/textPathway.html'
                , ''
                , 'https://rawgit.com/nanjizal/justDrawing/master/binOpenFL/Exports/html5/release/bin/index.html'
                , 'https://rawgit.com/nanjizal/Zeal/master/deploy/index.html'
                , 'https://rawgit.com/nanjizal/CookingHaxe/master/Graphics/Creating-WebGL/01.Triangles-for-Vector-2D-graphics/index.html'
                , 'https://github.com/nanjizal/code-cookbook/blob/master/assets/content/cookbook/Graphics/Creating-WebGL/01.Triangles-for-Vector-2D-graphics.md'
                , 'https://github.com/nanjizal/code-cookbook/blob/master/assets/content/cookbook/Graphics/Java-Swing-and-AWT/01.Drawing-a-Circle.md'
                , ''
                , ''
                , ''
                , 'https://github.com/nanjizal/code-cookbook/blob/master/assets/content/cookbook/Graphics/Creating-SVG/01.Drawing-a-Circle.md'
                , 'https://github.com/hxDaedalus/hxDaedalus'
                , 'https://rawgit.com/nanjizal/triangulationsWebGLtest/master/index.html'
                , 'https://github.com/nanjizal/hxSpiro'
                ];
        imageTotal = images.length;
        var delay = 0.;
        var stepDelay = 3.;
        var l = imageTotal;
        images[0].show(0.);      
        System.notifyOnRender(render);
        Scheduler.addTimeTask(update, 0, 1 / 60);
        Keyboard.get().notify(keyDown, keyUp);

    }
    // Over button that RafaelOliveira gave me :) I have simplified it a bit.
    public static var htmlBt:AnchorElement;
	public static function createHtmlButton( url:String, onClickFunc:Void->Void = null)
	{
		htmlBt = Browser.document.createAnchorElement();
		htmlBt.id = "buttonId";
		htmlBt.href = url;
		htmlBt.target = '_blank';
		htmlBt.style.display = 'block';
		htmlBt.style.width = '1024px';
		htmlBt.style.height = '768px';
		htmlBt.style.position = 'absolute';
		htmlBt.style.left = '0px';
		htmlBt.style.top = '0px';
		htmlBt.addEventListener('click', function(){ removeHtmlButton(); });
		Browser.document.body.appendChild(htmlBt);
	}
	public function createLinkButton( i: Int ){
        if( links[i] != '' ){
            removeHtmlButton();
            createHtmlButton( links[i], null );
        } else {
            removeHtmlButton();
        }
    }
	public static function removeHtmlButton()
	{
		if( htmlBt != null ) Browser.document.body.removeChild(htmlBt);
        htmlBt = null;
    }
    public function changeImage( i: Int ){
        if( i < 0 ) {
            i = 0;
            if( i == imageCount ) return;
        } 
        if( i > imageTotal - 1 ){
            i = imageTotal - 1;
            if( i == ( imageTotal - 1 ) ) return;
        }
        if( i == imageCount ) return;
        images[i].show( 0.15 );
        createLinkButton( i );
        images[imageCount].hide( 0. );
        imageCount = i;
    }
    public function keyDown(keyCode:Int):Void{
        switch( keyCode ){
            case KeyCode.Left:  
                changeImage( imageCount - 1 );
            case KeyCode.Right: 
                changeImage( imageCount + 1 );
            case KeyCode.Up:    
                
            case KeyCode.Down:  
                
            default: 
                
        }
    }
    public function keyUp(keyCode:Int  ):Void{ 
        switch( keyCode ){
            case KeyCode.Left:  
                
            case KeyCode.Right: 
                
            case KeyCode.Up:    
                
            case KeyCode.Down:  
                
            default: 
                
        }
    }
    function update(): Void {
        
    }
    function render(framebuffer: Framebuffer): Void {
        var g2 = framebuffer.g2;
        g2.begin();
        g2.clear(Color.fromValue(0xff000000));
        var l = imageTotal;
        for( i in 0...l ){
            var img = images[ i ];
            if( img != null ){
                var alpha = img.alpha;
                g2.opacity = alpha;
                g2.drawImage( img.image, 0, 0 );
                g2.opacity = 1.;
            }
        }
        g2.end();
    }
}