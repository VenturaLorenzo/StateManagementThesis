int pixelsSquared = 10;
double pixelWidth = 2;
double pixelHeight = 2;
int numPoints = 100;
int interval = 25;

List<List<bool>> generatePixels(){
  return List.generate(pixelsSquared,
          (index) => List.generate(pixelsSquared, (index) => false));
}
