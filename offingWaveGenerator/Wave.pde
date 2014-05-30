class Wave {
  float waveX;
  float waveY;
  float waveL;

  Wave(float waveX, float waveY, float waveL) {
    this.waveX = waveX;
    this.waveY = waveY;
    this.waveL = waveL;
  }

  float amp(float x, float y) {
    float ampX = x - this.waveX;
    float ampY = y - this.waveY;
    return sin((sqrt(ampX * ampX + ampY * ampY) - frameCount) / this.waveL);
  }
}
