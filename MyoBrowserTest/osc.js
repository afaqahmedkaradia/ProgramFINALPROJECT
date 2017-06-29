var Myo = require('myo'), rightMyo;
//var flock = require('./flocking/flocking-all');
if (typeof rightMyo === "undefined" && this.arm === "right"){
        rightMyo = this; 
        rightMyo.on('pose', function(pose){
            console.log(this.arm+ ":" + pose);
        });
        rightMyo.on('pose_off', function(pose){
            console.log(this.arm+ ":" + pose + " off");
        });
        rightMyo.on('unlocked', function(){
            console.log(this.arm + ": unlocked"); 
        });
    }

Myo.on("connected", function(){
    console.log('Myo Connected');
});

Myo.on('wave_out', function(){  
   console.log('Wave Out!');
   this.vibrate();
   //synth.play();
});

Myo.on('wave_in', function(){  
   console.log('Wave In!');
   this.vibrate();
   //synth.pause();
});

/*function play() {
    myStuff.play();
}

var synth = flock.synth({
    synthDef: {
        ugen: "flock.ugen.sinOsc",
        freq: 440,
        mul: 0.25
    }
});*/
Myo.connect('org.adamtindale.myoosc', require('ws'));