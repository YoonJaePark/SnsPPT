

//Swing �� �̿��� �޸��� ���α׷��� by mkjang;







import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.*;
import javax.swing.*;



//�޸��� �����
public class Memo extends JFrame implements ActionListener{

// 1. ������..  
//    1) �ؽ�Ʈ area ����
 private TextArea text = new TextArea();

//    2) �޴��ٿ� �޴� ����
 private MenuBar mb = new MenuBar();
 private Menu file = new Menu("����");
 private Menu help = new Menu("����");
 private Menu info = new Menu("��������");
 private MenuItem fnew = new MenuItem("���� �����");
 private MenuItem fopen = new MenuItem("����");
 private MenuItem fsave = new MenuItem("����");
 private MenuItem fexit = new MenuItem("�ݱ�");
 private MenuItem fhelp = new MenuItem("���� �׸񺸱�");
 private MenuItem finfo = new MenuItem("My����");

 //  3) ���� ���� ���� ����
 private FileDialog mSave = new FileDialog(this,"����" ,FileDialog.SAVE);
 private FileDialog mOpen = new FileDialog(this,"����" ,FileDialog.LOAD);



 // 2.�����ڿ��� �׼� ����
 public Memo(){
  
  // 1) ���� ����    
  super("�޸��� by mkjang");
  
  // 2) �޸��忡 �޴� ���
  mb.add(file);
  mb.add(help);
  mb.add(info);
       
  // 3) �޴��� �Ӽ� ���
  
  file.add(fnew);
  file.addSeparator();
  file.add(fopen);
  file.add(fsave);
  file.addSeparator();
  file.add(fexit);
  
  help.add(fhelp);
  info.add(finfo);
  
  // 4) �޴��ٸ� �� Ŭ������ ���� �ݵ�� ���۾��� �ʿ���.
  this.setMenuBar(mb);
  
  // 5) �ؽ�Ʈ �ʵ� ���
  this.add(text);
  
  // 6) ũ�� ���� 
  this.setBounds(100, 100, 550,400);
  this.setVisible(true);  // ȭ�鿡 �����ֱ�.. true


// 7) ��ɱ��� �̺�Ʈ �ڵ鷯 �߰�
  fexit.addActionListener(this);
  fopen.addActionListener(this);
  fsave.addActionListener(this);
  fnew.addActionListener(this);
  finfo.addActionListener(this);
  fhelp.addActionListener(this);
 }  // ������ end
 
 
 // 3. ���� ���� ���� ����
 public void filesave(){  //����
  mSave.setVisible(true);
  String data = mSave.getDirectory()+ mSave.getFile();  //������ ���丮 ������ ���ϸ��� ��´�.
  try{
   String str="";
   FileWriter fw = new FileWriter(data);  
   BufferedWriter bw = new BufferedWriter(fw);
   
   bw.write(text.getText());  //Textarea �� bw��ü�� �ִ� ������ �ִ´�.
   bw.close();
   String Filename = mSave.getFile();  // ������ ������ �̸��� �ְ�..
   setTitle(Filename);  // ���ϸ����� ����..
  }catch(Exception e){
   
  }
 }
 
 public void fileopen(){  //����
  mOpen.setVisible(true); 
  String data = mOpen.getDirectory()+ mOpen.getFile();
  try{
   String str="";
   FileReader fr = new FileReader(data);
   BufferedReader br = new BufferedReader(fr);
   
   text.setText("");  // �ϴ� �ʱ�ȭ..
   while((str=br.readLine()) != null){   // str�� ���Ƶ� ������ null �� �ƴϸ�..
    text.append(str);  // str�� ������ �߰�
   }
   br.close();
   String Filename = mOpen.getFile();
   setTitle(Filename);
  } catch(Exception e){
   
  }
 }
 
 
 
 // 4. �޴� �Ӽ��� ���� ����
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
    JOptionPane.showMessageDialog(null,"�̷��͵� �����־�� �ϳ���? " +
     "���ο� Ÿ����..");
  }
}
 
 // �ۼ��� ����(Infomkjang) Ŭ���� �ۼ�
 public class Infomkjang extends JDialog{  // ���� Ŭ����
  
  private TextArea text = new TextArea();
  
  public Infomkjang(JFrame a){
   super(a);
   Font ff = new Font("����",Font.ITALIC,16);
   String data = "<�޸��� by mkjang>\n";
   data += "\n�ۼ��� : ����";
   data += "\n�ۼ��� : 2009.09.05";
   data += "\n����      : ��Ŭ����";
   
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
