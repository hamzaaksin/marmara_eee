class Point2D {
    private double x;
    private double y;

    public Point2D(double x, double y) {
        this.x = x; // eşittirin sağındaki x ve y değerleri yukarıda constructor parantezinin içindeki 
        this.y = y;  // değerlerdir. a ve b olsaydı this.x = a derdik mesela
    }

    public double distance(double x, double y) {
        return distance(new Point2D(x, y));
    }

    public double distance(Point2D p) {
        return distance(this, p);
    }

    public static double distance(Point2D p1, Point2D p2) {
       double x1 = p1.getX();
       double x2 = p2.getX();
       double y1 = p1.getY();
       double y2 = p2.getY();
       
       double distance = 0;

       distance = Math.sqrt(Math.pow((x1 - x2), 2) + Math.pow((y1 - y2), 2));
        return distance;
    }

    public Point2D midpoint(Point2D p) {
        double a = this.x;  // yukarıdaki private olarak aldığımız x i çektik a ya atadık
        double b = this.y // private olarak aldığımız y yi b ye atadık
        double X1 = p.getX();
        double Y1 = p.getY();

        double X = ((a + X1) / 2.0);
        double Y = ((b + Y1) / 2.0);
        return new Point2D(X, Y);
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }
}