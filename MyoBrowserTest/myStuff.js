

function play() {
    myStuff.play();
}


// Simple sine wave oscillator
var synth = flock.synth({
    synthDef: {
        ugen: "flock.ugen.sinOsc",
        freq: 440,
        mul: 0.25
    }
});