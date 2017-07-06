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
typedef Slides = { image: Image, url: String }
@:enum abstract GitURL( String ) to String from String {
    var Luxe_LSystemRecurse         = 'https://rawgit.com/nanjizal/L-System/master/bin/webIteration/index.html';
    var Luxe_LSystemAnimation       = 'https://rawgit.com/nanjizal/L-System/master/bin/web/index.html';
    var Div_quadraticBezier         = 'https://rawgit.com/nanjizal/divtasticDemo/master/bezier_movement/BezierMovement.html';
    var Div_cubicBezier             = 'https://rawgit.com/nanjizal/divtasticDemo/master/cubic_bezier/CubicBezier.html';
    var Div_chainBeziers            = 'https://rawgit.com/nanjizal/divtasticDemo/master/bezier_chain/BezierChain.html';
    var Div_colorPicker             = 'https://rawgit.com/nanjizal/divtasticDemo/master/color_picker/ColorPicker.html';
    var Div_clocks                  = 'https://rawgit.com/nanjizal/divtasticDemo/master/div_clock/DivClock.html';
    var Div_polyK                   = 'https://rawgit.com/nanjizal/hxPolyK/master/polyKdivs/index.html';
    var Kha4_justTriangles          = 'https://rawgit.com/nanjizal/justTrianglesKhaG2/master/build/index.html';
    var Kha2_justTriangles          = 'https://rawgit.com/nanjizal/JustTrianglesKha4/master/build/html5/index.html';
    var CanvasDiv_JigsawX           = 'https://rawgit.com/nanjizal/JigsawX/master/bin/JigsawDivtastic.html';
    var Luxe_Maddelbrot_hxPixels    =  'https://rawgit.com/nanjizal/Mandelbrot/master/binLuxe/web/index.html';
    var Kha2_Mandelbrot_hxPixels    = 'https://rawgit.com/nanjizal/Mandelbrot/master/build/html5/index.html';
    var Luxe_ATriangle              = 'https://rawgit.com/nanjizal/ATriangle/master/LuxeEmpty/bin/web/index.html';
    var Kha_ATriangle               = 'https://rawgit.com/nanjizal/ATriangle/master/khaEmpty/build/html5/index.html';
    var Canvas_Letters              = 'https://rawgit.com/nanjizal/Letters/master/web/textPathway.html';
    var OpenFL_justDrawing          = 'https://rawgit.com/nanjizal/justDrawing/master/binOpenFL/Exports/html5/release/bin/index.html';
    var Canvas_Zeal                 = 'https://rawgit.com/nanjizal/Zeal/master/deploy/index.html';
    var WebGL_HaxeLogo              = 'https://rawgit.com/nanjizal/CookingHaxe/master/Graphics/Creating-WebGL/01.Triangles-for-Vector-2D-graphics/index.html';
    var WebGL_setup                 = 'https://github.com/nanjizal/code-cookbook/blob/master/assets/content/cookbook/Graphics/Creating-WebGL/01.Triangles-for-Vector-2D-graphics.md';
    var Swing_Circle                = 'https://github.com/nanjizal/code-cookbook/blob/master/assets/content/cookbook/Graphics/Java-Swing-and-AWT/01.Drawing-a-Circle.md';
    var Swing_setup                 = 'https://github.com/nanjizal/code-cookbook/blob/master/assets/content/cookbook/Graphics/Creating-SVG/01.Drawing-a-Circle.md';
    var hxDaedalus_git              = 'https://github.com/hxDaedalus/hxDaedalus';
    var WebGL_triangles             = 'https://rawgit.com/nanjizal/triangulationsWebGLtest/master/index.html';
    var spiro_git                   = 'https://github.com/nanjizal/hxSpiro';
    var poly2TriHx                  = 'http://nerik.github.io/poly2trihx/';
}
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
        var slides:Array<Slides> = [ 
                       { image: imgs.makingShapesJustin,        url: ''                         }
                    ,  { image: imgs.twoDimages,                url: ''                         }
                    ,  { image: imgs.mandelbrotImageLuxe,       url: Luxe_Maddelbrot_hxPixels   }
                    ,  { image: imgs.mandelbrotImageKha,        url: Kha2_Mandelbrot_hxPixels   }
                    ,  { image: imgs.zeal,                      url: Canvas_Zeal                }
                    ,  { image: imgs.generatingCurves,          url: Div_quadraticBezier        }
                    ,  { image: imgs.cubicBezierImage,          url: Div_cubicBezier            }
                    ,  { image: imgs.bezierChain,               url: Div_chainBeziers           }
                    ,  { image: imgs.clock,                     url: Div_clocks                 }
                    ,  { image: imgs.picker,                    url: Div_colorPicker            }
                    ,  { image: imgs.generatingCurves,          url: ''       }
                    ,  { image: imgs.spiro,                     url: spiro_git                  }
                    ,  { image: imgs.generatingCurves,          url: ''        }
                    ,  { image: imgs.lsystem,                   url: Luxe_LSystemRecurse        }
                    ,  { image: imgs.Lsystem2,                  url: Luxe_LSystemAnimation      }
                    ,  { image: imgs.luxeTriangle,              url: Luxe_ATriangle             }
                    ,  { image: imgs.khaTriangle,               url: Kha_ATriangle              }
                    ,  { image: imgs.abcdefg,                   url: poly2TriHx                 }
                    ,  { image: imgs.polyKDivtastic,            url: Div_polyK                  }
                    ,  { image: imgs.lettersSimple,             url: Canvas_Letters             }
                    ,  { image: imgs.jigsawXimage,              url: CanvasDiv_JigsawX          }
                    ,  { image: imgs.javaSwingCircleExample,    url: Swing_Circle               }
                    ,  { image: imgs.JFrame,                    url: Swing_setup                }
                    ,  { image: imgs.Jpanel,                    url: ''                         }
                    ,  { image: imgs.swingCircle,               url: ''                         }
                    ,  { image: imgs.settingupSVG,              url: ''                         }
                    ,  { image: imgs.justDrawingKiwi,           url: OpenFL_justDrawing         }
                    ,  { image: imgs.shaderDiagram,             url: WebGL_HaxeLogo             }
                    ,  { image: imgs.setupWebgl,                url: WebGL_setup                }
                    ,  { image: imgs.justTrianglesK2image,      url: Kha2_justTriangles         }
                    ,  { image: imgs.justTriangles,             url: Kha4_justTriangles         }
                    ,  { image: imgs.hxDaedalusImg,             url: hxDaedalus_git             }
                    ,  { image: imgs.ruppert,                   url: WebGL_triangles            }
                    ,  { image: imgs.monkeyImage,                url: 'https://rawgit.com/nanjizal/Monkey/master/build/html5/index.html' }
                    ];
        var len = slides.length;
        images  = new Array<ImageWrapper>();
        links   = new Array<String>();
        var aSlide: Slides;
        for( i in 0...len ){
            aSlide = slides[ i ];
            images[ i ] = new ImageWrapper( aSlide.image );
            links[ i ]  = aSlide.url;
        }
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