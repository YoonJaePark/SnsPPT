
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics2D;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
 
import javax.imageio.ImageIO;
 
import org.apache.poi.hslf.model.Slide;
import org.apache.poi.hslf.usermodel.SlideShow;
 
/**
 * PPT파일을 이미지로 변환
 * @author falbb
 *
 */
public class PPTConvterImage {
 
	private String pptFile;
	private String cvtImgFile;
 
	public PPTConvterImage(String pptFile, String cvtImgFile) {
		this.pptFile = pptFile;
		this.cvtImgFile = cvtImgFile;
	}
 
	/**
	 * 이미지 변환 실행
	 * @throws IOException
	 */
	public void convter(String type) throws IOException {
 
		// PPT파일
		FileInputStream is = new FileInputStream(pptFile);
 
		SlideShow ppt = new SlideShow(is);
 
		// PPT파일 닫기
		is.close();
 
		Dimension pgsize = ppt.getPageSize();
 
		Slide[] slide = ppt.getSlides();
 
		for (int i = 0; i < slide.length; i++) {
 
			BufferedImage img = new BufferedImage(pgsize.width, pgsize.height,
					BufferedImage.TYPE_INT_RGB);
			Graphics2D graphics = img.createGraphics();
			// 이미지 영역을 클리어
			graphics.setPaint(Color.white);
			graphics.fill(new Rectangle2D.Float(0, 0, pgsize.width,
					pgsize.height));
 
			// 이미지 그리기
			slide[i].draw(graphics);
 
			// 파일로 저장
			FileOutputStream out = new FileOutputStream(cvtImgFile +"이름"+(i + 1)
					+ "."+type);
			ImageIO.write(img, type, out);
			out.close();
		}
	}
 
	/**
	 * @param args
	 */
	public static void main(String[] args) {
 
		String pptFile = "C:\\Users\\ParkYoonJae\\git\\SnsPPT\\jspbook\\war\\upload\\Hello poi.ppt";
		String cvtImgFile = "C:\\Users\\ParkYoonJae\\git\\SnsPPT\\jspbook\\war\\upload\\img\\";
 
		PPTConvterImage cvtImage = new PPTConvterImage(pptFile, cvtImgFile);
		try {
			cvtImage.convter("jpg");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}