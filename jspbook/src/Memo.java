

//Swing 을 이용한 메모장 프로그래밍 by mkjang;







import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.*;
import javax.swing.*;



//메모장 만들기
public class Memo extends JFrame implements ActionListener{

// 1. 선언편..  
//    1) 텍스트 area 생성
 private TextArea text = new TextArea();

//    2) 메뉴바와 메뉴 생성
 private MenuBar mb = new MenuBar();
 private Menu file = new Menu("파일");
 private Menu help = new Menu("도움말");
 private Menu info = new Menu("버전정보");
 private MenuItem fnew = new MenuItem("새로 만들기");
 private MenuItem fopen = new MenuItem("열기");
 private MenuItem fsave = new MenuItem("저장");
 private MenuItem fexit = new MenuItem("닫기");
 private MenuItem fhelp = new MenuItem("도움말 항목보기");
 private MenuItem finfo = new MenuItem("My정보");

 //  3) 파일 저장 열기 구현
 private FileDialog mSave = new FileDialog(this,"저장" ,FileDialog.SAVE);
 private FileDialog mOpen = new FileDialog(this,"열기" ,FileDialog.LOAD);



 // 2.생성자에서 액션 구현
 public Memo(){
  
  // 1) 제목 설정    
  super("메모장 by mkjang");
  
  // 2) 메모장에 메뉴 등록
  mb.add(file);
  mb.add(help);
  mb.add(info);
       
  // 3) 메뉴에 속성 등록
  
  file.add(fnew);
  file.addSeparator();
  file.add(fopen);
  file.add(fsave);
  file.addSeparator();
  file.add(fexit);
  
  help.add(fhelp);
  info.add(finfo);
  
  // 4) 메뉴바를 현 클래스에 적용 반드시 이작업이 필요함.
  this.setMenuBar(mb);
  
  // 5) 텍스트 필드 등록
  this.add(text);
  
  // 6) 크기 설정 
  this.setBounds(100, 100, 550,400);
  this.setVisible(true);  // 화면에 보여주기.. true


// 7) 기능구현 이벤트 핸들러 추가
  fexit.addActionListener(this);
  fopen.addActionListener(this);
  fsave.addActionListener(this);
  fnew.addActionListener(this);
  finfo.addActionListener(this);
  fhelp.addActionListener(this);
 }  // 생성자 end
 
 
 // 3. 파일 열기 저장 구현
 public void filesave(){  //저장
  mSave.setVisible(true);
  String data = mSave.getDirectory()+ mSave.getFile();  //파일의 디렉토리 정보와 파일명을 얻는다.
  try{
   String str="";
   FileWriter fw = new FileWriter(data);  
   BufferedWriter bw = new BufferedWriter(fw);
   
   bw.write(text.getText());  //Textarea 에 bw객체에 있는 내용을 넣는다.
   bw.close();
   String Filename = mSave.getFile();  // 저장을 파일의 이름을 넣고..
   setTitle(Filename);  // 파일명으로 저장..
  }catch(Exception e){
   
  }
 }
 
 public void fileopen(){  //열기
  mOpen.setVisible(true); 
  String data = mOpen.getDirectory()+ mOpen.getFile();
  try{
   String str="";
   FileReader fr = new FileReader(data);
   BufferedReader br = new BufferedReader(fr);
   
   text.setText("");  // 일단 초기화..
   while((str=br.readLine()) != null){   // str에 남아둔 내용이 null 이 아니면..
    text.append(str);  // str의 내용을 추가
   }
   br.close();
   String Filename = mOpen.getFile();
   setTitle(Filename);
  } catch(Exception e){
   
  }
 }
 
 
 
 // 4. 메뉴 속성에 대한 구현
public void actionPerformed(ActionEvent e) {
  if(e.getSource()== fnew){
     super.setTitle("");
     text.setText("");
  }
  if(e.getSource()== fopen){
     fileopen();
  } 
  if(e.getSource()== fsave){
    filesave();
  }
  if(e.getSource()== fexit){
    System.exit(0);
 }
  if(e.getSource()== finfo){
    Infomkjang ob = new Infomkjang(this);  
    ob.setVisible(true);   
 }
  if(e.getSource()== fhelp){
    JOptionPane.showMessageDialog(null,"이런것도 도와주어야 하나요? " +
     "버로우 타세요..");
  }
}
 
 // 작성자 정보(Infomkjang) 클래스 작성
 public class Infomkjang extends JDialog{  // 내부 클래스
  
  private TextArea text = new TextArea();
  
  public Infomkjang(JFrame a){
   super(a);
   Font ff = new Font("굴림",Font.ITALIC,16);
   String data = "<메모장 by mkjang>\n";
   data += "\n작성자 : 장명규";
   data += "\n작성일 : 2009.09.05";
   data += "\n버전      : 이클립스";
   
   text.append(data);
   text.setFont(ff);
  
   this.add(text);
   this.setBounds(300,300,250,200);
   this.setVisible(true);
  }
 } // Infomkjang class end



// 5. main
public static void main(String[] ar){
Memo ob = new Memo();
ob.setDefaultCloseOperation(ob.EXIT_ON_CLOSE);

}

} // class end
