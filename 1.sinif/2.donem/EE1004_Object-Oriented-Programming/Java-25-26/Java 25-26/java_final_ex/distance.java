class Point2D {
    private double x;
    private double y;

    public Point2D(double x, double y) {
        this.x = x;
        this.y = y;
    }

    public double distance(double x, double y) {
        return distance(new Point2D(x, y));
    }

    public double distance(Point2D p) {
        return distance(this, p);
    }

    public static double distance(Point2D p1, Point2D p2) {
        // Write code to implement it
        double x1 = p1.getX();
        double x2 = p2.getX();
        double y1 = p1.getY();
        double y2 = p2.getY();

        double distance = Math.sqrt(Math.pow((x1-x2), 2) + Math.pow((y1-y2), 2)); 

        return distance;
    }

    public Point2D midpoint(Point2D p) { // // neden return Point2D yazdık çünkü method Point2D dönderiyor burada görüyoruz.
        // Write code to implement it
        double x1 = this.getX();
        double y1 = this.getY();
        double x2 = p.getX();
        double y2 = p.getY();

        double midpoint1 = (x1 + x2) / 2 ;
        double midpoint2 = (y1 + y2) / 2 ;

        return new Point2D(midpoint1 , midpoint2); // neden Point2D yazdık çünkü method Point2D dönderiyor yukarıda görüyoruz.
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }
}