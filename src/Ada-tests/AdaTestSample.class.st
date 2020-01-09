"
some programs for the tests
"
Class {
	#name : #AdaTestSample,
	#superclass : #Object,
	#category : #'Ada-tests-samples'
}

{ #category : #'spec_expressions' }
AdaTestSample class >> EOFExceptionExample [
	"http://sandbox.mc.edu/~bennet/ada/examples/"
	'^ --
-- This simply reads the lines of its input file and uses the End_Error
-- exception to detect EOF.
--
with Ada.Text_IO; use Ada.Text_IO;
	Put_Line(S(1..N));
	
procedure ReadOut is
   S: String(1..100);
   N: Integer;
begin
   -- Issue the lovely decoration.
   Put_Line("-----------------------------------------------------" &
            "-----------");

   -- Copy lines like theres no tomorrow.
   loop
      Get_Line(S, N);
      Get_Line(S, N);
   end loop;

   exception
   when End_Error =>
      -- When reaching end of file, issue the closing lovely decoration and
      -- return from the procedure.
      Put_Line("-----------------------------------------------------" &
               "-----------");
      return;
end ReadOut;'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a01_simple1 [
	
	^'procedure Simple1 is
   procedure P1 is
   begin
       Put;
   end P1;
   procedure P2 is
   begin
       Put;
   end P2;
   procedure P3 is
   begin
       Put;
   end P3;
   function F1 return BOOLEAN is
   begin
      Put;
   end F1;
begin
  Put;
end Hello;'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a02_simple2 [
	"function parameters added"
	
	^'procedure Simple2 is
   procedure P1 is
   begin
       Put;
   end P1;
   procedure P2 is
   begin
       Put;
   end P2;
   procedure P3 is
   begin
       Put;
   end P3;

   function F1(X : in out INTEGER) return BOOLEAN is
   begin
      Put;
   end F1;
begin
  Put;
end Hello;'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a03_firstText [
	
	^'procedure FirstText is
begin
     null;
     var1 := var2 and 4;
     Putline;

     if null = null then
          null;
     end if;
     if 4 = 5 then
          Putline;
     end if;
     if (4 = 5) and (6>7) then
          Putline;
     end if;
     while (15>4) or (4<3) or (5=5) loop
         Putline;
     end loop;
     case aCase is
          when A => Putline;
          when B => Putline;
     end case;
     loop
        Putline;
     end loop;
end Hello;'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a04_simpleFunction [
	"from: http://sandbox.mc.edu/~bennet/ada/examples/f1_adb.html"
	
	^'
with Gnat.Io; use Gnat.Io;
procedure f1 is

   I: Integer;

   function Sumsqr(X, Y: Integer) return Integer is
   begin
      return X*X + Y*Y;
   end;

begin

   I := Sumsqr(3, 14);
   Put(I);
   New_Line;
   Put(Sumsqr(I, 4));
   New_Line;

end f1;'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a05_simpleArrayExample [
	" from http://sandbox.mc.edu/~bennet/ada/examples/arr1_adb.html
'' means one apostrophe
Print with
  str := AdaTestCode simpleArrayExample.
  Transcript show: str
(without printString because this would double apostrophes)"
	
	^'
with Gnat.Io; use Gnat.Io;
procedure Arr1 is
   A: array(1..5) of Integer;
   I: Integer;
begin
   for I in 1..5 loop
      Put("> ");
      Get(A(I));
   end loop;

   Put("[");
   for I in reverse A''Range loop
      Put(A(I));
      if I > A''First then
         Put;
      end if;
   end loop;
   Put_Line("]");
end Arr1;'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a06_larger1 [
	"different declarations"
	
	^'with Except;
with Screen_Output;
with Stack;
with Values;

procedure Larger1 is

   I : Integer;
   MAX : constant := 5;
   type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
   subtype RED_BLUE is RAINBOW;
   subtype SMALL_INT is INTEGER range 5 .. 10;

   procedure P1 is
   begin
       Put;
   end P1;
   procedure P2 is
   begin
       Put;
   end P2;
   procedure P3 is
   begin
       Put;
   end P3;
   function F1(X : in out INTEGER) return BOOLEAN is
   begin
      Put;
   end F1;

begin
     null;
     var1 := var2 and 4;
     Putline;     

     if null = null then
          null;
     end if;
     if 4 = 5 then
          Putline;
     end if;
     if (4 = 5) and (6>7) then
          Putline;
     end if;
     while (15>4) or (4<3) or (5=5) loop
         Putline;
     end loop;
     case aCase is
          when A => Putline;
          when B => Putline;
     end case;
     loop
        Putline;
     end loop;
     return A;
end Hello;'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a07_larger2 [
	
	^'with Except;
with Screen_Output;
with Stack;
with Values;
with TEXT_IO, REAL_OPERATIONS; use REAL_OPERATIONS;

procedure Larger2 is

    A : Integer;
    MAX : constant := 5;
    type DAY is (MON, TUE, WED, THU, FRI, SAT, SUN);
    subtype RED_BLUE is RAINBOW;
    subtype SMALL_INT is INTEGER range 5 .. 10;

    procedure P1 is
    begin
        Put;
    end P1;
    procedure P2 is
    begin
        Put;
    end P2;
    procedure P3 is
    begin
        Put;
    end P3;
    function F1(X : in out INTEGER) return BOOLEAN is
    begin
        Put;
        A := A*A;
        A := A-MAX;
        return A;
    end F1;

begin
    null;
    var1 := var2 and 4;
    
    D := B**2 - 4*A*C;

    Putline;
    Putline( A, B );
    Putline( A * B );     

    if null = null then
        null;
    end if;
    if 4 = 5 then
        Putline;
    end if;
    if (4 = 5) and (6>7) then
        Putline;
    end if;
    while (15>4) or (4<3) or (5=5) loop
        Putline;
    end loop;
    case aCase is
        when A => Putline;
        when B => Putline;
    end case;
    loop
       Putline;
    end loop;

    return a;

end Hello;'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a08_calculator [
	"from: http://sandbox.mc.edu/~bennet/ada/examples/calc_adb.html
Integer calculator program.  Takes lines of input consisting of
<operator> <number>, and applies each one to a display value.  The
display value is printed at each step.  The operator is one of =,
+, -, *, /, or ^, which correspond to assign, add, subtract, multiply
divide, and raise, respectively.  The display value is initially zero.
The program terminates on a input of q."
	
	^'
with Text_IO;
with Gnat.Io; use Gnat.Io;
procedure Calc is
   Op: Character;
   Disp: Integer := 0;
   In_Val: Integer;
begin
   loop
      Put(Disp);
      New_Line;

      Put("> ");

      loop
         Get(Op);
         exit;
      end loop;

      exit;

      Get(In_Val);
      Text_IO.Skip_Line;

      case Op is
         when "="      => Disp := In_Val;
         when "+"      => Disp := Disp + In_Val;
         when "-"      => Disp := Disp - In_Val;
         when "*"      => Disp := Disp * In_Val;
         when "/"      => Disp := Disp / In_Val;
         when "^"      => Disp := Disp ** In_Val;
         when "0".."9" => Put_Line("Please specify an operation.");
         when others   => Put_Line("What is " & Op & "?");
      end case;
   end loop;
end Calc;'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a09_quadratic_equation [
	"from: http://www.adahome.com/LRM/83/RM/rm83html/lrm-10-01.html#10.1"
	
	^'
    with TEXT_IO, REAL_OPERATIONS; use REAL_OPERATIONS;
    procedure QUADRATIC_EQUATION is
       A, B, C, D : REAL;
       use REAL_IO,
           TEXT_IO,
           REAL_FUNCTIONS;
    begin
       GET(A); GET(B); GET(C);
       D := B**2 - 4*A*C;
       if D < 0 then
          PUT("Imaginary Roots.");
       else
          PUT("Real Roots : X1 = ");
          PUT((-B - SQRT(D))/(2*A)); PUT(" X2 = ");
          PUT((-B + SQRT(D))/(2*A));
       end if;
       NEW_LINE; 
    end QUADRATIC_EQUATION;'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a10_numericConstantsAndExpressions [
	"from: http://sandbox.mc.edu/~bennet/ada/examples/numbers_adb.html"
	"--
-- Some numbers to come and go.
--
with Gnat.Io; use Gnat.Io;"
	
	^'procedure Numbers is
   Mike, Alice: Integer;
   John_Smith: Integer;
   F: Float := 1.0;
begin
   Put("Enter a number Mike: ");
   Get(Mike);
   Put("Enter a number Alice: ");
   Get(Alice);
   John_Smith := 3*Mike + 2*Alice + 2#1011#;
   Put("3*Mike + 2*Alice + 11 is ");
   Put(John_Smith);
   New_Line;

   John_Smith := Mike + Alice + 1_000_000;
   Put("A million more than Mike and Alice ");
   Put(John_Smith);
   New_Line;

   F := F + Float(Mike) + 3.14159_265;
   Put("And F as an integer is ");
   Put(Integer(F));
   New_Line;
end Numbers;'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a11_cube [
	"from http://www.adapower.com/index.php?Command=Class&ClassID=AdaGraphics&Title=Graphics+Examples
without procedure_specifications and 'aliased' (not ada83)"
	
	^'with Win32.Gl;
with Win32.Glu;
with Win32.Glaux;
with Interfaces.C;
with Interfaces.C.Strings;

procedure Cube is

   use Win32.Gl;
   use Win32.Glu;
   use Win32.Glaux;
   use Interfaces;

   Res : GLenum;

   pragma Convention (Stdcall, MyReshape);
   pragma Convention (Stdcall, Display);

   procedure MyInit is
   begin
      glShadeModel (GL_FLAT);
   end MyInit;

   procedure MyReshape (W, H : in GLsizei) is
   begin
      glMatrixMode (GL_PROJECTION);
      glLoadIdentity;
      glFrustum (-1.0, 1.0, -1.0, 1.0, 1.5, 20.0);
      glMatrixMode (GL_MODELVIEW);
      glViewport (0, 0, W, H);
   end MyReshape;

   procedure Display is
   begin
      glClear (GL_COLOR_BUFFER_BIT);
      glColor3f (1.0, 1.0, 1.0);
      glLoadIdentity;
      glTranslatef (0.0, 0.0, -5.0);
      glScalef (1.0, 2.0, 1.0);
      auxWireCube (1.0);
      glFlush;
   end Display;

begin
   auxInitDisplayMode (AUX_SINGLE + AUX_RGB);
   auxInitPosition (0, 0, 500, 500);
   Res := auxInitWindow (Window_Name (Window_Name''First)''Unchecked_Access);
   MyInit;
   auxReshapeFunc (MyReshape''Unrestricted_Access);
   auxMainLoop (Display''Unrestricted_Access);
end Cube;'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a12_alpha [
	"from http://www.adapower.com/index.php?Command=Class&ClassID=AdaGraphics&Title=Graphics+Examples"
	"without 'aliased' and procedure_specifications"
	
	^'with Win32.Gl;
with Win32.Glu;
with Win32.Glaux;
with Interfaces.C;
with Interfaces.C.Strings;

procedure alpha is

   use Win32.Gl;
   use Win32.Glu;
   use Win32.Glaux;
   use Interfaces;

   Res : GLenum;

   pragma Convention (Stdcall, MyReshape);
   pragma Convention (Stdcall, Display);


   procedure MyInit is
   begin
      auxCreateFont;

      glEnable (GL_BLEND);
      glBlendFunc (GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
      glShadeModel (GL_FLAT);
      glClearColor (1.0, 1.0, 1.0, 0.0);
   end MyInit;


   procedure MyReshape (W, H :  in GLsizei) is
   begin

      glViewport (0, 0, W, H);
      glMatrixMode (GL_PROJECTION);
      glLoadIdentity;
      gluOrtho2D (0.0, 1.0, 0.0, 1.0);

      glMatrixMode (GL_MODELVIEW);
      glLoadIdentity;

   end MyReshape;


   procedure Display is

   begin

      glClear (GL_COLOR_BUFFER_BIT);

      glColor4d (1.0, 0.0, 0.0, 0.2);
      glRectd (0.0, 0.0, 0.7, 1.0);
      glRectd (0.3, 0.0, 1.0, 1.0);
      glRectd (0.0, 0.3, 1.0, 1.0);
      glRectd (0.0, 0.6, 1.0, 1.0);

      glColor3d (0.0, 0.0, 1.0);

      glBegin (GL_LINES);
      glVertex2d (0.1, 0.1);
      glVertex2d (0.9, 0.9);
      glEnd;

      glBegin (GL_LINES);
      glVertex2d (0.1, 0.9);
      glVertex2d (0.9, 0.1);
      glEnd;

      glRasterPos2d (0.5, 0.5);
      auxDrawStr (Annotation (Annotation''First));

      glFlush;

   end Display;

begin
   auxInitDisplayMode (AUX_SINGLE + AUX_RGB);
   auxInitPosition (0, 0, 500, 500);
   Res := auxInitWindow (Window_Name (Window_Name''First)''Unchecked_Access);
   MyInit;
   auxReshapeFunc (MyReshape''Unrestricted_Access);
   auxMainLoop (Display''Unrestricted_Access);
end alpha;'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a13_sphere [
	"from http://sandbox.mc.edu/~bennet/ada/examples/readrest2_adb.html"
	"without procedure_specification, alias"
	
	^'with Interfaces.C;
with Win32.Gl;
with Win32.Glu;
with Win32.Glaux;

procedure Sphere is

   use Win32.Gl;
   use Win32.Glu;
   use Win32.Glaux;
   use Interfaces;

   Res : GLenum;

   pragma Convention (Stdcall, Display);

   procedure Display is
   begin
      glClear (GL_COLOR_BUFFER_BIT);
      glColor3f (1.0, 1.0, 1.0);
      glPushMatrix;
      glTranslatef (0.0, 0.0, -5.0);
      auxWireSphere (1.0);
      glPopMatrix;
      glFlush;
   end Display;

   procedure MyInit is
   begin
      glShadeModel (GL_FLAT);
   end MyInit;

   pragma Convention (Stdcall, MyReshape);

   procedure MyReshape (W : in GLsizei; H : in GLsizei) is
      Lh : GLsizei;
   begin
      if H = 0 then
         Lh := 1;
      else
         Lh := H;
      end if;
      glViewport (0, 0, W, H);
      glMatrixMode (GL_PROJECTION);
      glLoadIdentity;
      gluPerspective (60.0, GLdouble (W) / GLdouble (H), 1.0, 20.0);
      glMatrixMode (GL_MODELVIEW);
   end MyReshape;

begin
   auxInitDisplayMode (AUX_SINGLE + AUX_RGB);
   auxInitPosition (0, 0, 400, 400);
   Res := auxInitWindow (Window_Name (Window_Name''First)''Unchecked_Access);
   MyInit;
   auxReshapeFunc (MyReshape''Unrestricted_Access);
   auxMainLoop (Display''Unrestricted_Access);
end Sphere;'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a14_planet [
	"from http://www.adapower.com/index.php?Command=Class&ClassID=AdaGraphics&Title=Graphics+Examples
without procedure_specifications and 'aliased' (not ada83)"
	
	^'with Win32.Gl;
with Win32.Glu;
with Win32.Glaux;
with Interfaces.C;
with Interfaces.C.Strings;

procedure Planet is

   use Win32.Gl;
   use Win32.Glu;
   use Win32.Glaux;
   use Interfaces;

   Res : GLenum;

   pragma Convention (Stdcall, MyReshape);

   pragma Convention (Stdcall, Display);

   pragma Convention (Stdcall, DayAdd);

   pragma Convention (Stdcall, DaySubtract);

   pragma Convention (Stdcall, YearAdd);

   pragma Convention (Stdcall, YearSubtract);

   Year : Mod_360 := 0;
   Day  : Mod_360 := 0;

   procedure DayAdd is
   begin
      Day := (Day + 10);
   end DayAdd;

   procedure DaySubtract is
   begin
      Day := (Day - 10);
   end DaySubtract;

   procedure YearAdd is
   begin
      Year := (Year + 5);
   end YearAdd;

   procedure YearSubtract is
   begin
      Year := (Year - 5);
   end YearSubtract;

   procedure Display is
   begin
      glClear (GL_COLOR_BUFFER_BIT);

      glColor3f (1.0, 1.0, 1.0);
      glPushMatrix;
      auxWireSphere (1.0);
      glRotatef (GLfloat (Year), 0.0, 1.0, 0.0);
      glTranslatef (2.0, 0.0, 0.0);
      glRotatef (GLfloat (Day), 0.0, 1.0, 0.0);
      auxWireSphere (0.2);
      glPopMatrix;
      glFlush;
   end Display;

   procedure MyInit is
   begin
      glShadeModel (GL_FLAT);
   end MyInit;

   procedure MyReshape (W, H : GLsizei) is
      Lh : GLsizei;
   begin
      if H = 0 then
         Lh := 1;
      else
         Lh := H;
      end if;
      glViewport (0, 0, W, H);
      glMatrixMode (GL_PROJECTION);
      glLoadIdentity;
      gluPerspective (60.0, GLdouble (W) / GLdouble (Lh), 1.0, 20.0);
      glMatrixMode (GL_MODELVIEW);
      glLoadIdentity;
      glTranslatef (0.0, 0.0, -5.0);
   end MyReshape;

begin
   auxInitDisplayMode (AUX_SINGLE + AUX_RGB);
   auxInitPosition (0, 0, 500, 500);
   Res := auxInitWindow (Window_Name (Window_Name''First)''Unchecked_Access);
   MyInit;
   auxKeyFunc (AUX_LEFT, YearSubtract''Unrestricted_Access);
   auxKeyFunc (AUX_RIGHT, YearAdd''Unrestricted_Access);
   auxKeyFunc (AUX_UP, DayAdd''Unrestricted_Access);
   auxKeyFunc (AUX_DOWN, DaySubtract''Unrestricted_Access);
   auxReshapeFunc (MyReshape''Unrestricted_Access);
   auxMainLoop (Display''Unrestricted_Access);
end Planet;'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a15_tselect [
	"from http://www.adapower.com/index.php?Command=Class&ClassID=AdaGraphics&Title=Graphics+Examples
without procedure_specifications and 'aliased' (not ada83)"
	
	^'with Win32.Gl;
with Win32.Glu;
with Win32.Glaux;
with Interfaces.C.Strings;
with Ada.Text_IO;

procedure tSelect is

   use Win32.Gl;
   use Win32.Glu;
   use Win32.Glaux;
   use Interfaces;
   use Ada.Text_IO;

   Res : GLenum;

   pragma Convention (Stdcall, Display);

   procedure DrawTriangle
     (X1 : in GLfloat; Y1 : in GLfloat; X2 : in GLfloat;
      Y2 : in GLfloat; X3 : in GLfloat; Y3 : in GLfloat;
      Z  : in GLfloat) is
   begin
      glBegin (GL_TRIANGLES);
      glVertex3f (X1, Y1, Z);
      glVertex3f (X2, Y2, Z);
      glVertex3f (X3, Y3, Z);
      glEnd;
   end DrawTriangle;

   procedure DrawViewVolume
     (X1 : in GLfloat; X2 : in GLfloat; Y1 : in GLfloat;
      Y2 : in GLfloat; Z1 : in GLfloat; Z2 : in GLfloat) is
   begin
      glColor3f (1.0, 1.0, 1.0);
      glBegin (GL_LINE_LOOP);
      glVertex3f (X1, Y1, -Z1);
      glVertex3f (X2, Y1, -Z1);
      glVertex3f (X2, Y2, -Z1);
      glVertex3f (X1, Y2, -Z1);
      glEnd;

      glBegin (GL_LINE_LOOP);
      glVertex3f (X1, Y1, -Z2);
      glVertex3f (X2, Y1, -Z2);
      glVertex3f (X2, Y2, -Z2);
      glVertex3f (X1, Y2, -Z2);
      glEnd;

      glBegin (GL_LINES);
      glVertex3f (X1, Y1, -Z1);
      glVertex3f (X1, Y1, -Z2);
      glVertex3f (X1, Y2, -Z1);
      glVertex3f (X1, Y2, -Z2);
      glVertex3f (X2, Y1, -Z1);
      glVertex3f (X2, Y1, -Z2);
      glVertex3f (X2, Y2, -Z1);
      glVertex3f (X2, Y2, -Z2);
      glEnd;
   end DrawViewVolume;

   procedure DrawScene is
   begin
      glMatrixMode (GL_PROJECTION);
      glLoadIdentity;
      gluPerspective (40.0, 4.0/3.0, 0.01, 100.0);

      glMatrixMode (GL_MODELVIEW);
      glLoadIdentity;
      gluLookAt (7.5, 7.5, 12.5, 2.5, 2.5, -5.0, 0.0, 1.0, 0.0);

      glColor3f (0.0, 1.0, 0.0);
      DrawTriangle (2.0, 2.0, 3.0, 2.0, 2.5, 3.0, -5.0);

      glColor3f (1.0, 0.0, 0.0);
      DrawTriangle (2.0, 7.0, 3.0, 7.0, 2.5, 8.0, -5.0);

      glColor3f (1.0, 1.0, 0.0);
      DrawTriangle (2.0, 2.0, 3.0, 2.0, 2.5, 3.0, 0.0);
      DrawTriangle (2.0, 2.0, 3.0, 2.0, 2.5, 3.0, -10.0);
      DrawViewVolume (0.0, 5.0, 0.0, 5.0, 0.0, 10.0);
   end DrawScene;

   pragma Convention (C, GLuint_Array);

   procedure ProcessHits (Hits   : in GLint;
                          Buffer : in GLuint_Array) is

      procedure Put (V : in GLuint) is
      begin
         Put (GLuint''Image (V));
      end Put;

   begin
      for I in 1 .. Hits loop

         Names := Buffer (P);

         Put (" number of names for hit = "); Put (Names); New_Line;
         Put ("  z1 is "); Put (Buffer (P + 1));
         Put ("; z2 is "); Put (Buffer (P + 2)); New_Line;
         Put ("   the name is ");
         P := P + 3;

         for J in 1 .. Names loop
            Put (Buffer (P));
            P := P + 1;
         end loop;

         New_Line;

      end loop;
   end ProcessHits;

   procedure SelectObjects is
      SelectBuf : GLuint_Array;
      Hits      : GLint;
      Res       : GLint;
   begin
      glSelectBuffer (BUFSIZE, SelectBufAccess);
      Res := glRenderMode (GL_SELECT);

      glInitNames;
      glPushName (-1);

      glPushMatrix;
      glMatrixMode (GL_PROJECTION);
      glLoadIdentity;
      glOrtho (0.0, 5.0, 0.0, 5.0, 0.0, 10.0);
      glMatrixMode (GL_MODELVIEW);
      glLoadIdentity;

      glLoadName (1);
      DrawTriangle (2.0, 2.0, 3.0, 2.0, 2.5, 3.0, -5.0);

      glLoadName (2);
      DrawTriangle (2.0, 7.0, 3.0, 7.0, 2.5, 8.0, -5.0);

      glLoadName (3);
      DrawTriangle (2.0, 2.0, 3.0, 2.0, 2.5, 3.0, 0.0);
      DrawTriangle (2.0, 2.0, 3.0, 2.0, 2.5, 3.0, -10.0);
      glPopMatrix;
      glFlush;

      Hits := glRenderMode (GL_RENDER);
      ProcessHits (Hits, SelectBuf);
   end SelectObjects;

   procedure MyInit is
   begin
      glDepthFunc (GL_LESS);
      glEnable (GL_DEPTH_TEST);
      glShadeModel (GL_FLAT);
   end MyInit;

   procedure Display is
   begin
      glClearColor (0.0, 0.0, 0.0, 0.0);
      glClear (GL_COLOR_BUFFER_BIT + GL_DEPTH_BUFFER_BIT);
      DrawScene;
      SelectObjects;
      glFlush;
   end Display;

begin
   auxInitDisplayMode (AUX_SINGLE + AUX_RGB + AUX_DEPTH16);
   auxInitPosition (0, 0, 200, 200);
   Res := auxInitWindow (Window_Name (Window_Name''First)''Unchecked_Access);
   MyInit;
   auxMainLoop (Display''Unrestricted_Access);
end tSelect;'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a16_surfaced [
	"from http://www.adapower.com/index.php?Command=Class&ClassID=AdaGraphics&Title=Graphics+Examples"
	"without 'aliased' and procedure_specifications"
	
	^'with Win32.Gl;
with Win32.Glu;
with Win32.Glaux;
with Interfaces.C;
with Interfaces.C.Strings;
with Defines;

procedure Surface is

   use Win32.Gl;
   use Win32.Glu;
   use Win32.Glaux;
   use Interfaces;
   use Defines;

   Res : GLenum;

   CtlPoints : array (1 .. 4, 1 .. 4, 1 .. 3) of GLfloat;
   theNurb   : PGLUnurbsObj;

   pragma Convention (Stdcall, MyReshape);

   pragma Convention (Stdcall, Display);

   procedure MyInit is

      Mat_Diffuse   : GLvector := (0.7, 0.7, 0.7, 1.0);
      Mat_Specular  : GLvector := (1.0, 1.0, 1.0, 1.0);

      procedure Init_Surface is
      begin
         for U in CtlPoints''Range loop
            for V in CtlPoints''Range loop
               CtlPoints (U, V, 1) := 2.0 * (GLfloat (U) - 1.5);
               CtlPoints (U, V, 2) := 2.0 * (GLfloat (V) - 1.5);

               if (U = 1 or U = 2) and  (V = 1 or V = 2) then
                  CtlPoints (U, V, 3) := 3.0;
               else
                  CtlPoints (U, V, 3) := -3.0;
               end if;
            end loop;
         end loop;
      end Init_Surface;

   begin
      glClearColor (0.0, 0.0, 0.0, 1.0);

      glMaterialfv (GL_FRONT, GL_DIFFUSE, Mat_Diffuse (1)''Unchecked_Access);
      glMaterialfv (GL_FRONT, GL_SPECULAR, Mat_Specular (1)''Unchecked_Access);
      glMaterialf (GL_FRONT, GL_SHININESS, 100.0);

      glEnable (GL_LIGHTING);
      glEnable (GL_LIGHT0);
      glDepthFunc (GL_LESS);
      glEnable (GL_DEPTH_TEST);
      glEnable (GL_AUTO_NORMAL);
      glEnable (GL_NORMALIZE);

      Init_Surface;

      theNurb := gluNewNurbsRenderer;
      gluNurbsProperty (theNurb, GLU_SAMPLING_TOLERANCE, 25.0);
      gluNurbsProperty (theNurb, GLU_DISPLAY_MODE, GLfloat (GLU_FILL));
   end MyInit;

   procedure MyReshape (W, H : in GLsizei) is
   begin
      glViewport (0, 0, W, H);
      glMatrixMode (GL_PROJECTION);
      glLoadIdentity;
      gluPerspective (45.0, GLdouble (W) / GLdouble (H), 3.0, 8.0);
      glMatrixMode (GL_MODELVIEW);
      glLoadIdentity;
      glTranslatef (0.0, 0.0, -5.0);
   end MyReshape;

   procedure Display is
      Knots : GLvector := (0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 1.0);
   begin
      glClear (GL_COLOR_BUFFER_BIT + GL_DEPTH_BUFFER_BIT);
      glPushMatrix;
      glRotatef (330.0, 1.0, 0.0, 0.0);
      glScalef (0.5, 0.5, 0.5);

      gluBeginSurface (theNurb);
      gluNurbsSurface (theNurb,
                       8, Knots (1)''Unchecked_Access,
                       8, Knots (1)''Unchecked_Access,
                       4 * 3,
                       3,
                       CtlPoints (1, 1, 1)''Unchecked_Access,
                       4, 4,
                       GL_MAP2_VERTEX_3);
      gluEndSurface (theNurb);

      glPopMatrix;
      glFlush;

   end Display;

begin
   auxInitDisplayMode (AUX_SINGLE + AUX_RGB);
   auxInitPosition (0, 0, 500, 500);
   Res := auxInitWindow (Window_Name (Window_Name''First)''Unchecked_Access);
   MyInit;
   auxReshapeFunc (MyReshape''Unrestricted_Access);
   auxMainLoop (Display''Unrestricted_Access);
end Surface;'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a17_fog [
	"from http://sandbox.mc.edu/~bennet/ada/examples/readrest2_adb.html"
	"without 'aliased' and procedure_specifications"
	
	^'
with Win32.Gl;
with Win32.Glu;
with Win32.Glaux;
with Interfaces.C;
with Interfaces.C.Strings;
with Defines;

procedure Fog is

   use Win32.Gl;
   use Win32.Glu;
   use Win32.Glaux;
   use Interfaces;
   use Defines;

   Res : GLenum;

   pragma Convention (Stdcall, MyReshape);

   pragma Convention (Stdcall, Display);

   pragma Convention (Stdcall, CycleFog);

   FogMode : GLint;

   procedure CycleFog (Event : AUX_EVENTREC) is
   begin
      if FogMode = GL_EXP then
         FogMode := GL_EXP2;
      elsif FogMode = GL_EXP2 then
         FogMode := GL_LINEAR;
         glFogf (GL_FOG_START, 1.0);
         glFogf (GL_FOG_END, 5.0);
      elsif FogMode = GL_LINEAR then
         FogMode := GL_EXP;
      end if;
      glFogi (GL_FOG_MODE, FogMode);
   end CycleFog;

   procedure MyInit is

      Position   : GLvector := (0.0, 3.0, 3.0, 0.0);
      Local_View : GLfloat := 0.0;

   begin
      glEnable (GL_DEPTH_TEST);
      glDepthFunc (GL_LESS);

      glLightfv (GL_LIGHT0, GL_POSITION, Position (1)''Unchecked_Access);
      glLightModelfv (GL_LIGHT_MODEL_LOCAL_VIEWER,
                      Local_View''Unchecked_Access);

      glFrontFace (GL_CW);
      glEnable (GL_LIGHTING);
      glEnable (GL_LIGHT0);
      glEnable (GL_AUTO_NORMAL);
      glEnable (GL_NORMALIZE);
      glEnable (GL_FOG);

      FogMode := GL_EXP;
      glFogi (GL_FOG_MODE, FogMode);
      glFogfv (GL_FOG_COLOR, FogColor (1)''Unchecked_Access);
      glFogf (GL_FOG_DENSITY, 0.35);
      glHint (GL_FOG_HINT, GL_DONT_CARE);
      glClearColor (0.5, 0.5, 0.5, 1.0);

   end MyInit;

   procedure RenderRedTeapot (X : in GLfloat;
                              Y : in GLfloat;
                              Z : in GLfloat) is
      Mat : GLvector (1 .. 3);
   begin
      glPushMatrix;
      glTranslatef (X, Y, Z);

      Mat := (0.1745, 0.01175, 0.01175);
      glMaterialfv (GL_FRONT, GL_AMBIENT, Mat (1)''Unchecked_Access);

      Mat := (0.61424, 0.04136, 0.04136);
      glMaterialfv (GL_FRONT, GL_DIFFUSE, Mat (1)''Unchecked_Access);

      Mat := (0.727811, 0.626959, 0.626959);
      glMaterialfv (GL_FRONT, GL_SPECULAR, Mat (1)''Unchecked_Access);

      glMaterialf (GL_FRONT, GL_SHININESS, 0.6*128.0);
      auxSolidTeapot (1.0);
      glPopMatrix;
   end RenderRedTeapot;

   procedure Display is
   begin
      glClear (GL_COLOR_BUFFER_BIT + GL_DEPTH_BUFFER_BIT);
      RenderRedTeapot (-4.0, -0.5, -1.0);
      RenderRedTeapot (-2.0, -0.5, -2.0);
      RenderRedTeapot (0.0, -0.5, -3.0);
      RenderRedTeapot (2.0, -0.5, -4.0);
      RenderRedTeapot (4.0, -0.5, -5.0);
      glFlush;
   end Display;

   procedure MyReshape (W, H : GLsizei) is
      Lh : GLsizei;
   begin
      if H = 0 then
         Lh := 1;
      else
         Lh := H;
      end if;
      glViewport (0, 0, W, Lh);
      glMatrixMode (GL_PROJECTION);
      glLoadIdentity;
      if W <= (Lh * 3) then
         glOrtho (-6.0, 6.0, -2.0 * (GLdouble (Lh) * 3.0) / GLdouble (W),
                  2.0* (GLdouble (Lh) * 3.0) / GLdouble (W), 0.0, 10.0);
      else
         glOrtho (-6.0*GLdouble (W) / (GLdouble (Lh) * 3.0),
                  6.0*GLdouble (W) / (GLdouble (Lh) * 3.0),
                  -2.0, 2.0, 0.0, 10.0);
      end if;
      glMatrixMode (GL_MODELVIEW);
      glLoadIdentity;
   end MyReshape;

begin
   auxInitDisplayMode (AUX_SINGLE + AUX_RGB + AUX_DEPTH16);
   auxInitPosition (0, 0, 450, 150);
   Res := auxInitWindow (Window_Name (Window_Name''First)''Unchecked_Access);
   auxMouseFunc (AUX_LEFTBUTTON, AUX_MOUSEDOWN,
                 CycleFog''Unrestricted_Access);
   MyInit;
   auxReshapeFunc (MyReshape''Unrestricted_Access);
   auxMainLoop (Display''Unrestricted_Access);
end Fog;
'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a18_cube_glut [
	"from http://www.adapower.com/index.php?Command=Class&ClassID=AdaGraphics&Title=Graphics+Examples"
	"without 'aliased' and procedure_specifications"
	
	^'with Win32.Gl;
with Win32.Glu;
with Glut;
with Interfaces.C;
with Interfaces.C.Strings;

procedure Cube_Glut is

   use Win32.Gl;
   use Win32.Glu;
   use Glut;
   use Interfaces;

   Window_Name : constant String := "Perspective 3-D Cube";

   Res : Integer;


   procedure MyInit is

   begin

      GlShadeModel (GL_FLAT);

   end MyInit;



   procedure MyReshape (W, H : in Integer) is

   begin

      GlMatrixMode (GL_PROJECTION);

      GlLoadIdentity;

      GlFrustum (-1.0, 1.0, -1.0, 1.0, 1.5, 20.0);

      GlMatrixMode (GL_MODELVIEW);

      GlViewPort (0, 0, GLsizei(W), GLsizei(H));

   end MyReshape;



   procedure Display is

   begin

      GlClear (GL_COLOR_BUFFER_BIT);

      GlColor3f (1.0, 1.0, 1.0);

      GlLoadIdentity;

      GlTranslatef (0.0, 0.0, -5.0);

      GlScalef (1.0, 2.0, 1.0);

      glutWireCube (1.0);

      GlFlush;

   end Display;



begin

   glutInitDisplayMode (Display_Mode);

   glutInitWindowPosition (0, 0);

   glutInitWindowSize (500, 500);

   Res := glutCreateWindow (Window_Name);

   MyInit;

   glutReshapeFunc (MyReshape''Unrestricted_Access);

   glutDisplayFunc (Display''Unrestricted_Access);

   glutmainloop;

end Cube_Glut;'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a19_movelight [
	"from http://www.adapower.com/index.php?Command=Class&ClassID=AdaGraphics&Title=Graphics+Examples"
	"without 'aliased' and procedure_specifications"
	
	^'with Win32.Gl;

with Win32.Glu;

with Win32.Glaux;

with Interfaces.C;

with Interfaces.C.Strings;

with Defines;



procedure MoveLight is



   use Win32.Gl;

   use Win32.Glu;

   use Win32.Glaux;

   use Interfaces;

   use Defines;

   Res : GLenum;

   pragma Convention (Stdcall, MyReshape);

   pragma Convention (Stdcall, Display);

   pragma Convention (Stdcall, MoveTheLight);


   procedure MoveTheLight (Event : AUX_EVENTREC) is

   begin

      Spin := (Spin + 30);

   end MoveTheLight;



   procedure MyInit is

   begin

      glEnable (GL_LIGHTING);

      glEnable (GL_LIGHT0);



      glDepthFunc (GL_LESS);

      glEnable (GL_DEPTH_TEST);

   end MyInit;



   procedure Display is

      Position : GLvector := (0.0, 0.0, 1.5, 1.0);

   begin

      glClear (GL_COLOR_BUFFER_BIT + GL_DEPTH_BUFFER_BIT);

      glPushMatrix;

      glTranslatef (0.0, 0.0, -5.0);



      glPushMatrix;

      glRotated (GLdouble (Spin), 1.0, 0.0, 0.0);

      glRotated (0.0, 1.0, 0.0, 0.0);

      glLightfv (GL_LIGHT0, GL_POSITION, Position (1)''Unchecked_Access);



      glTranslated (0.0, 0.0, 1.5);

      glDisable (GL_LIGHTING);

      glColor3f (0.0, 1.0, 1.0);

      auxWireCube (0.1);

      glEnable (GL_LIGHTING);

      glPopMatrix;



      auxSolidTorus (0.275, 0.85);

      glPopMatrix;

      glFlush;

   end Display;



   procedure MyReshape (W, H : GLsizei) is

      Lh : GLsizei;

   begin

      if H = 0 then

         Lh := 1;

      else

         Lh := H;

      end if;

      glViewport (0, 0, W, Lh);

      glMatrixMode (GL_PROJECTION);

      glLoadIdentity;

      gluPerspective (40.0, GLdouble (W) / GLdouble (Lh), 1.0, 20.0);

      glMatrixMode (GL_MODELVIEW);

   end MyReshape;



begin

   auxInitDisplayMode (AUX_SINGLE + AUX_RGB + AUX_DEPTH16);

   auxInitPosition (0, 0, 500, 500);

   Res := auxInitWindow (Window_Name (Window_Name''First)''Unchecked_Access);

   MyInit;

   auxMouseFunc (AUX_LEFTBUTTON, AUX_MOUSEDOWN,

                 MoveTheLight''Unrestricted_Access);

   auxReshapeFunc (MyReshape''Unrestricted_Access);

   auxMainLoop (Display''Unrestricted_Access);

end MoveLight;'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a20_stencil [
	"from http://www.adapower.com/index.php?Command=Class&ClassID=AdaGraphics&Title=Graphics+Examples"
	"without 'aliased' and procedure_specifications"
	
	^'

with Win32.Gl;

with Win32.Glu;

with Win32.Glaux;

with Interfaces.C;

with Interfaces.C.Strings;

with Defines;



procedure Stencil is



   use Win32.Gl;

   use Win32.Glu;

   use Win32.Glaux;

   use Interfaces;

   use Defines;



   Res : GLenum;



   YELLOWMAT : constant := 1;

   BLUEMAT   : constant := 2;


   pragma Convention (Stdcall, MyReshape);

   pragma Convention (Stdcall, Display);



   procedure MyInit is



      Yellow_Diffuse  : GLvector := (0.7, 0.7, 0.0, 1.0);

      Yellow_Specular : GLvector := (1.0, 1.0, 1.0, 1.0);



      Blue_Diffuse    : GLvector := (0.1, 0.1, 0.7, 1.0);

      Blue_Specular   : GLvector := (0.1, 1.0, 1.0, 1.0);



      Position_One    : GLvector := (1.0, 1.0, 1.0, 0.0);



   begin



      glNewList (YELLOWMAT, GL_COMPILE);

      glMaterialfv (GL_FRONT, GL_DIFFUSE,

                    Yellow_Diffuse (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SPECULAR,

                    Yellow_Specular (1)''Unchecked_Access);

      glMaterialf (GL_FRONT, GL_SHININESS, 64.0);

      glEndList;



      glNewList (BLUEMAT, GL_COMPILE);

      glMaterialfv (GL_FRONT, GL_DIFFUSE,

                    Blue_Diffuse (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SPECULAR,

                    Blue_Specular (1)''Unchecked_Access);

      glMaterialf (GL_FRONT, GL_SHININESS, 45.0);

      glEndList;



      glLightfv (GL_LIGHT0, GL_POSITION,

                 Position_One (1)''Unchecked_Access);



      glEnable (GL_LIGHT0);

      glEnable (GL_LIGHTING);

      glDepthFunc (GL_LESS);

      glEnable (GL_DEPTH_TEST);



      glClearStencil (16#0#);

      glEnable (GL_STENCIL_TEST);

   end MyInit;



   procedure Display is

   begin

      glClear (GL_COLOR_BUFFER_BIT + GL_DEPTH_BUFFER_BIT);



      glStencilFunc (GL_EQUAL, 16#1#, 16#1#);

      glCallList (BLUEMAT);

      auxSolidSphere (0.5);



      glStencilFunc (GL_NOTEQUAL, 16#1#, 16#1#);

      glStencilOp (GL_KEEP, GL_KEEP, GL_KEEP);

      glPushMatrix;

      glRotatef (45.0, 0.0, 0.0, 1.0);

      glRotatef (45.0, 0.0, 1.0, 0.0);

      glCallList (YELLOWMAT);

      auxSolidTorus (0.275, 0.85);



      glPushMatrix;

      glRotatef (90.0, 1.0, 0.0, 0.0);

      auxSolidTorus (0.275, 0.85);

      glPopMatrix;



      glPopMatrix;

      glFlush;

   end Display;



   procedure MyReshape (W, H : in GLsizei) is

   begin



      glViewport (0, 0, W, H);



      glClear (GL_STENCIL_BUFFER_BIT);



      glMatrixMode (GL_PROJECTION);

      glLoadIdentity;

      glOrtho (-3.0, 3.0, -3.0, 3.0, -1.0, 1.0);

      glMatrixMode (GL_MODELVIEW);

      glLoadIdentity;



      glStencilFunc (GL_ALWAYS, 16#1#, 16#1#);

      glStencilOp (GL_REPLACE, GL_REPLACE, GL_REPLACE);

      glBegin (GL_QUADS);

      glVertex3f (-1.0, 0.0, 0.0);

      glVertex3f (0.0, 1.0, 0.0);

      glVertex3f (1.0, 0.0, 0.0);

      glVertex3f (0.0, -1.0, 0.0);

      glEnd;



      glMatrixMode (GL_PROJECTION);

      glLoadIdentity;

      gluPerspective (45.0, GLdouble (W) / GLdouble (H), 3.0, 7.0);

      glMatrixMode (GL_MODELVIEW);

      glLoadIdentity;

      glTranslatef (0.0, 0.0, -5.0);

   end MyReshape;



begin

   auxInitDisplayMode (AUX_SINGLE + AUX_RGB + AUX_DEPTH16 + AUX_STENCIL);

   auxInitPosition (0, 0, 400, 400);

   Res := auxInitWindow (Window_Name (Window_Name''First)''Unchecked_Access);

   MyInit;

   auxReshapeFunc (MyReshape''Unrestricted_Access);

   auxMainLoop (Display''Unrestricted_Access);

end Stencil;

'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a21_test [
	"from http://www.adapower.com/index.php?Command=Class&ClassID=AdaGraphics&Title=Graphics+Examples"
	"without 'aliased' and procedure_specifications"
	
	^'with Win32.Gl;

with Win32.Glu;

with Win32.Glaux;

with Interfaces.C;

with Interfaces.C.Strings;

with Defines;



procedure Test is



   use Win32.Gl;

   use Win32.Glu;

   use Win32.Glaux;

   use Interfaces;

   use Defines;




   Res : GLenum;



   pragma Convention (Stdcall, MyReshape);


   pragma Convention (Stdcall, Display);




   procedure MyInit is



      Mat_Ambient  : GLvector := (0.0, 0.0, 1.0, 1.0);

      Mat_Specular : GLvector := (1.0, 1.0, 1.0, 1.0);



      Light_Position : GLvector := (0.5, 0.8, 0.0, 1.0);

      Lm_Ambient     : GLvector := (0.1, 0.1, 0.1, 1.0);



   begin

      glMaterialfv (GL_FRONT, GL_AMBIENT, Mat_Ambient (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SPECULAR, Mat_Specular (1)''Unchecked_Access);

      glMaterialf  (GL_FRONT, GL_SHININESS, 90.0);



      glLightfv      (GL_LIGHT0, GL_POSITION,

                      Light_Position (1)''Unchecked_Access);

      glLightModelfv (GL_LIGHT_MODEL_AMBIENT,

                      Lm_Ambient (1)''Unchecked_Access);



      glEnable (GL_LIGHTING);

      glEnable (GL_LIGHT0);

      glDepthFunc (GL_LESS);

      glEnable (GL_DEPTH_TEST);

      glShadeModel (GL_FLAT);



      glClearColor (0.0, 0.0, 0.0, 0.0);

   end MyInit;



   procedure MyReshape (W, H : in GLsizei) is

   begin

      glMatrixMode (GL_PROJECTION);

      glLoadIdentity;

      glFrustum (-1.0, 1.0, -1.0, 1.0, 1.5, 60.0);

      glMatrixMode (GL_MODELVIEW);

      glViewport (0, 0, W, H);

   end MyReshape;



   procedure Display is



      procedure Display_Objects is



         Cube_Diffuse : GLvector := (1.0, 0.1, 0.1, 0.4);



      begin

         glMaterialfv (GL_FRONT, GL_DIFFUSE,

                       Cube_Diffuse (1)''Unchecked_Access);

         auxSolidCube (1.0);

      end Display_Objects;



   begin

      glClear (GL_COLOR_BUFFER_BIT + GL_DEPTH_BUFFER_BIT);

      glLoadIdentity;

      glScalef (1.0, 2.0, 1.0);



      for I in reverse 3 .. 50 loop

         glClear (GL_COLOR_BUFFER_BIT + GL_DEPTH_BUFFER_BIT);

         glPushMatrix;

         glTranslatef (0.0, 0.0, -GLfloat (I));

         glRotatef (25.0, 0.3, 1.0, 0.0);

         Display_Objects;

         auxSwapBuffers;

         glPopMatrix;

      end loop;



      for I in reverse 1 .. 360 loop

         glClear (GL_COLOR_BUFFER_BIT + GL_DEPTH_BUFFER_BIT);

         glPushMatrix;

         glTranslatef (0.0, 0.0, -3.0);

         glRotatef (GLfloat (I * 2 mod 360), 0.3, 1.0, 0.0);

         Display_Objects;

         auxSwapBuffers;

         glPopMatrix;

      end loop;



      glFlush;

   end Display;



begin

   auxInitDisplayMode (AUX_DOUBLE + AUX_RGB + AUX_DEPTH);

   auxInitPosition (0, 0, 500, 500);

   Res := auxInitWindow (Window_Name (Window_Name''First)''Unchecked_Access);

   MyInit;

   auxReshapeFunc (MyReshape''Unrestricted_Access);

   auxMainLoop (Display''Unrestricted_Access);

end Test;

'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a22_material [
	"from http://www.adapower.com/index.php?Command=Class&ClassID=AdaGraphics&Title=Graphics+Examples"
	"without 'aliased' and procedure_specifications"
	
	^'

with Win32.Gl;

with Win32.Glu;

with Win32.Glaux;

with Interfaces.C;

with Interfaces.C.Strings;

with Defines;



procedure Material is



   use Win32.Gl;

   use Win32.Glu;

   use Win32.Glaux;

   use Interfaces;

   use Defines;



   Res : GLenum;

   pragma Convention (Stdcall, MyReshape);

   pragma Convention (Stdcall, Display);

   procedure MyInit is



      Ambient        : GLvector := (0.0, 0.0, 0.0, 1.0);

      Diffuse        : GLvector := (1.0, 1.0, 1.0, 1.0);

      Specular       : GLvector := (1.0, 1.0, 1.0, 1.0);

      Position       : GLvector := (0.0, 3.0, 2.0, 0.0);

      Lmodel_Ambient : GLvector := (0.4, 0.4, 0.4, 1.0);

      Local_View     : GLfloat   := 0.0;



   begin



      glEnable (GL_DEPTH_TEST);

      glDepthFunc (GL_LESS);



      glLightfv (GL_LIGHT0, GL_AMBIENT, Ambient (1)''Unchecked_Access);

      glLightfv (GL_LIGHT0, GL_DIFFUSE, Diffuse (1)''Unchecked_Access);

      glLightfv (GL_LIGHT0, GL_POSITION, Position (1)''Unchecked_Access);

      glLightModelfv (GL_LIGHT_MODEL_AMBIENT,

                      Lmodel_Ambient (1)''Unchecked_Access);

      glLightModelfv (GL_LIGHT_MODEL_LOCAL_VIEWER,

                      Local_View''Unchecked_Access);



      glEnable (GL_LIGHTING);

      glEnable (GL_LIGHT0);



      glClearColor (0.0, 0.1, 0.1, 0.0);

   end MyInit;





   procedure Display is

      No_Mat            : GLvector := (0.0, 0.0, 0.0, 1.0);

      Mat_Ambient       : GLvector := (0.7, 0.7, 0.7, 1.0);

      Mat_Ambient_Color : GLvector := (0.8, 0.8, 0.2, 1.0);

      Mat_Diffuse       : GLvector := (0.1, 0.5, 0.8, 1.0);

      Mat_Specular      : GLvector := (1.0, 1.0, 1.0, 1.0);

      No_Shininess      : GLfloat := 0.0;

      Low_Shininess     : GLfloat := 5.0;

      High_Shininess    : GLfloat := 100.0;

      Mat_Emission      : GLvector := (0.3, 0.2, 0.2, 0.0);

   begin



      glClear (GL_COLOR_BUFFER_BIT + GL_DEPTH_BUFFER_BIT);



      glPushMatrix;

      glTranslatef (-3.75, 3.0, 0.0);

      glMaterialfv (GL_FRONT, GL_AMBIENT, No_Mat (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_DIFFUSE, Mat_Diffuse (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SPECULAR, No_Mat (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SHININESS,

                    No_Shininess''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_EMISSION, No_Mat (1)''Unchecked_Access);

      auxSolidSphere (1.0);

      glPopMatrix;



      glPushMatrix;

      glTranslatef (-1.25, 3.0, 0.0);

      glMaterialfv (GL_FRONT, GL_AMBIENT, No_Mat (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_DIFFUSE, Mat_Diffuse (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SPECULAR, Mat_Specular (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SHININESS,

                    Low_Shininess''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_EMISSION, No_Mat (1)''Unchecked_Access);

      auxSolidSphere (1.0);

      glPopMatrix;



      glPushMatrix;

      glTranslatef (1.25, 3.0, 0.0);

      glMaterialfv (GL_FRONT, GL_AMBIENT, No_Mat (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_DIFFUSE, Mat_Diffuse (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SPECULAR, Mat_Specular (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SHININESS,

                    High_Shininess''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_EMISSION, No_Mat (1)''Unchecked_Access);

      auxSolidSphere (1.0);

      glPopMatrix;



      glPushMatrix;

      glTranslatef (3.75, 3.0, 0.0);

      glMaterialfv (GL_FRONT, GL_AMBIENT, No_Mat (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_DIFFUSE, Mat_Diffuse (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SPECULAR, No_Mat (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SHININESS,

                    No_Shininess''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_EMISSION, Mat_Emission (1)''Unchecked_Access);

      auxSolidSphere (1.0);

      glPopMatrix;



      glPushMatrix;

      glTranslatef (-3.75, 0.0, 0.0);

      glMaterialfv (GL_FRONT, GL_AMBIENT, Mat_Ambient (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_DIFFUSE, Mat_Diffuse (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SPECULAR, No_Mat (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SHININESS,

                    No_Shininess''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_EMISSION, No_Mat (1)''Unchecked_Access);

      auxSolidSphere (1.0);

      glPopMatrix;



      glPushMatrix;

      glTranslatef (-1.25, 0.0, 0.0);

      glMaterialfv (GL_FRONT, GL_AMBIENT, Mat_Ambient (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_DIFFUSE, Mat_Diffuse (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SPECULAR, Mat_Specular (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SHININESS,

                    Low_Shininess''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_EMISSION, No_Mat (1)''Unchecked_Access);

      auxSolidSphere (1.0);

      glPopMatrix;



      glPushMatrix;

      glTranslatef (1.25, 0.0, 0.0);

      glMaterialfv (GL_FRONT, GL_AMBIENT, Mat_Ambient (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_DIFFUSE, Mat_Diffuse (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SPECULAR, Mat_Specular (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SHININESS,

                    High_Shininess''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_EMISSION, No_Mat (1)''Unchecked_Access);

      auxSolidSphere (1.0);

      glPopMatrix;



      glPushMatrix;

      glTranslatef (3.75, 0.0, 0.0);

      glMaterialfv (GL_FRONT, GL_AMBIENT, Mat_Ambient (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_DIFFUSE, Mat_Diffuse (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SPECULAR, No_Mat (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SHININESS,

                    No_Shininess''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_EMISSION, Mat_Emission (1)''Unchecked_Access);

      auxSolidSphere (1.0);

      glPopMatrix;



      glPushMatrix;

      glTranslatef (-3.75, -3.0, 0.0);

      glMaterialfv (GL_FRONT, GL_AMBIENT,

                    Mat_Ambient_Color (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_DIFFUSE, Mat_Diffuse (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SPECULAR, No_Mat (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SHININESS,

                    No_Shininess''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_EMISSION, No_Mat (1)''Unchecked_Access);

      auxSolidSphere (1.0);

      glPopMatrix;



      glPushMatrix;

      glTranslatef (-1.25, -3.0, 0.0);

      glMaterialfv (GL_FRONT, GL_AMBIENT,

                    Mat_Ambient_Color (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_DIFFUSE, Mat_Diffuse (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SPECULAR, Mat_Specular (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SHININESS,

                    Low_Shininess''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_EMISSION, No_Mat (1)''Unchecked_Access);

      auxSolidSphere (1.0);

      glPopMatrix;



      glPushMatrix;

      glTranslatef (1.25, -3.0, 0.0);

      glMaterialfv (GL_FRONT, GL_AMBIENT,

                    Mat_Ambient_Color (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_DIFFUSE, Mat_Diffuse (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SPECULAR, Mat_Specular (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SHININESS,

                    High_Shininess''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_EMISSION, No_Mat (1)''Unchecked_Access);

      auxSolidSphere (1.0);

      glPopMatrix;



      glPushMatrix;

      glTranslatef (3.75, -3.0, 0.0);

      glMaterialfv (GL_FRONT, GL_AMBIENT,

                    Mat_Ambient_Color (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_DIFFUSE, Mat_Diffuse (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SPECULAR, No_Mat (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SHININESS,

                    No_Shininess''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_EMISSION,

                    Mat_Emission (1)''Unchecked_Access);

      auxSolidSphere (1.0);

      glPopMatrix;



      glFlush;

   end Display;



   procedure MyReshape (W, H : GLsizei) is

   begin

      glViewport (0, 0, W, H);

      glMatrixMode (GL_PROJECTION);

      glLoadIdentity;

      if W <= (H * 2) then

         glOrtho (-6.0, 6.0, -3.0 * (GLdouble (H) * 2.0) / GLdouble (W),

                  3.0 * (GLdouble (H) * 2.0) / GLdouble (W), -10.0, 10.0);

      else

         glOrtho (-6.0 * GLdouble (W) / (GLdouble (H) * 2.0),

                  6.0 * GLdouble (W) / (GLdouble (H) * 2.0), -3.0, 3.0,

                  -10.0, 10.0);

         glMatrixMode (GL_MODELVIEW);

      end if;

   end MyReshape;



begin

   auxInitDisplayMode (AUX_SINGLE + AUX_RGB + AUX_DEPTH16);

   auxInitPosition (0, 0, 600, 600);

   Res := auxInitWindow (Window_Name (Window_Name''First)''Unchecked_Access);

   MyInit;

   auxReshapeFunc (MyReshape''Unrestricted_Access);

   auxMainLoop (Display''Unrestricted_Access);

end Material;

'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a23_defines [
	"from http://www.adapower.com/index.php?Command=Class&ClassID=AdaGraphics&Title=Graphics+Examples"
	"without 'aliased' and procedure_specifications"
	
	^'
with Win32.GL;

package Defines is

   use Win32.Gl;

   type GLvector is array (Positive range <>) of GLfloat;

   type GLmatrix is
      array (Positive range <>, Positive range <>) of GLfloat;

   type GLmatrix_3 is
      array (Positive range <>, Positive range <>, Positive range <>) of GLfloat;

end Defines;
'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a24_depthcue [
	"from http://www.adapower.com/index.php?Command=Class&ClassID=AdaGraphics&Title=Graphics+Examples"
	"without 'aliased' and procedure_specifications"
	
	^'

with Win32.Gl;

with Win32.Glu;

with Win32.Glaux;

with Interfaces.C;

with Interfaces.C.Strings;

with Defines;



procedure DepthCue is



   use Win32.Gl;

   use Win32.Glu;

   use Win32.Glaux;

   use Interfaces;

   Res : GLenum;

   pragma Convention (Stdcall, MyReshape);

   pragma Convention (Stdcall, Display);

   procedure MyInit is

      FogColor : Defines.GLvector := (0.0, 0.0, 0.0, 1.0);

   begin

      glEnable (GL_FOG);

      glFogi (GL_FOG_MODE, GL_LINEAR);

      glHint (GL_FOG_HINT, GL_NICEST);

      glFogf (GL_FOG_START, 3.0);

      glFogf (GL_FOG_END, 5.0);

      glFogfv (GL_FOG_COLOR, FogColor (1)''Unchecked_Access);

      glClearColor (0.0, 0.0, 0.0, 1.0);



      glDepthFunc (GL_LESS);

      glEnable (GL_DEPTH_TEST);

      glShadeModel (GL_FLAT);

   end MyInit;



   procedure MyReshape (W, H : in GLsizei) is

   begin

      glViewport (0, 0, W, H);

      glMatrixMode (GL_PROJECTION);

      glLoadIdentity;

      gluPerspective (45.0, GLdouble (W) / GLdouble (H), 3.0, 5.0);

      glMatrixMode (GL_MODELVIEW);

      glLoadIdentity;

      glTranslatef (0.0, 0.0, -4.0);

   end MyReshape;



   procedure Display is

   begin

      glClear (GL_COLOR_BUFFER_BIT + GL_DEPTH_BUFFER_BIT);

      glColor3f (1.0, 1.0, 1.0);

      auxWireIcosahedron (1.0);

      glFlush;

   end Display;



begin

   auxInitDisplayMode (AUX_SINGLE + AUX_RGB + AUX_DEPTH16);

   auxInitPosition (0, 0, 400, 400);

   Res := auxInitWindow (Window_Name (Window_Name''First)''Unchecked_Access);

   MyInit;

   auxReshapeFunc (MyReshape''Unrestricted_Access);

   auxMainLoop (Display''Unrestricted_Access);

end DepthCue;

'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a25_double [
	"from http://www.adapower.com/index.php?Command=Class&ClassID=AdaGraphics&Title=Graphics+Examples"
	"without 'aliased' and procedure_specifications"
	
	^'with Win32.Gl;

with Win32.Glu;

with Win32.Glaux;

with Interfaces.C;

with Interfaces.C.Strings;



procedure Double is



   use Win32.Gl;

   use Win32.Glu;

   use Win32.Glaux;

   use Interfaces;

   Res : GLenum;

   pragma Convention (Stdcall, SpinDisplay);

   pragma Convention (Stdcall, StartIdleFunc);

   pragma Convention (Stdcall, StopIdleFunc);

   pragma Convention (Stdcall, MyReshape);


   pragma Convention (Stdcall, Display);


   Spin : GLfloat := 0.0;



   procedure MyInit is

   begin

      glClearColor (0.0, 0.0, 0.0, 0.0);

      glColor3f (1.0, 1.0, 1.0);

      glShadeModel (GL_FLAT);

   end MyInit;



   procedure MyReshape (W, H : in GLsizei) is

      LH : GLdouble := GLdouble (H);

      LW : GLdouble := GLdouble (W);

   begin

      if H = 0 then

         LH := 1.0;

      end if;

      glViewport (0, 0, GLsizei (LW), GLsizei (LH));

      glMatrixMode (GL_PROJECTION);

      glLoadIdentity;



      if LW <= LH then

         glOrtho (-50.0, 50.0, -50.0 * LH/LW, 50.0 * LH/LW, -1.0, 1.0);

      else

         glOrtho (-50.0 * LW/LH, 50.0 * LW/LH, -50.0, 50.0, -1.0, 1.0);

      end if;



      glMatrixMode (GL_MODELVIEW);

      glLoadIdentity;

   end MyReshape;



   procedure Display is

   begin

      glClear (GL_COLOR_BUFFER_BIT);



      glPushMatrix;

      glRotatef (Spin, 0.3, 1.0, 0.0);

      glRectf (-25.0, -25.0, 25.0, 25.0);

      glPopMatrix;



      glFlush;

      auxSwapBuffers;

   end Display;



   procedure SpinDisplay is

   begin

      Spin := Spin + 2.0;

      if Spin > 360.0 then

         Spin := Spin - 360.0;

      end if;

      Display;

   end SpinDisplay;



   procedure StartIdleFunc (Event : AUX_EVENTREC) is

   begin

      auxIdleFunc (SpinDisplay''Unrestricted_Access);

   end StartIdleFunc;



   procedure StopIdleFunc (Event : AUX_EVENTREC) is

   begin

      auxIdleFunc (null);

   end StopIdleFunc;





begin

   auxInitDisplayMode (AUX_DOUBLE + AUX_RGB);

   auxInitPosition (0, 0, 500, 500);

   Res := auxInitWindow (Window_Name (Window_Name''First)''Unchecked_Access);

   MyInit;

   auxReshapeFunc (MyReshape''Unrestricted_Access);

   auxIdleFunc (SpinDisplay''Unrestricted_Access);

   auxMouseFunc (AUX_LEFTBUTTON, AUX_MOUSEDOWN,

                 StartIdleFunc''Unrestricted_Access);

   auxMouseFunc (AUX_RIGHTBUTTON, AUX_MOUSEDOWN,

                 StopIdleFunc''Unrestricted_Access);

   auxMainLoop (Display''Unrestricted_Access);

end Double;

'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a26_light [
	"from http://www.adapower.com/index.php?Command=Class&ClassID=AdaGraphics&Title=Graphics+Examples"
	"without 'aliased' and procedure_specifications"
	
	^'with Win32.Gl;
with Win32.Glu;
with Win32.Glaux;
with Interfaces.C;
with Interfaces.C.Strings;
with Defines;

procedure Light is

   use Win32.Gl;
   use Win32.Glu;
   use Win32.Glaux;
   use Interfaces;
   use Defines;

   Res : GLenum;

   pragma Convention (Stdcall, MyReshape);
   pragma Convention (Stdcall, Display);

   procedure MyInit is

      Mat_Specular   : GLvector := (1.0, 0.5, 0.1, 1.0);
      Mat_Shininess  : GLfloat   := 50.0;

      Light_Position : GLvector := (1.0, 1.0, 1.0, 0.0);

   begin
      glMaterialfv (GL_FRONT, GL_SPECULAR, Mat_Specular (1)''Unchecked_Access);
      glMaterialf  (GL_FRONT, GL_SHININESS, Mat_Shininess);

      glLightfv      (GL_LIGHT0, GL_POSITION,
                      Light_Position (1)''Unchecked_Access);

      glEnable (GL_LIGHTING);
      glEnable (GL_LIGHT0);
      glDepthFunc (GL_LESS);
      glEnable (GL_DEPTH_TEST);
   end MyInit;

   procedure MyReshape (W, H : in GLsizei) is
      LH : GLdouble := GLdouble (H);
      LW : GLdouble := GLdouble (W);
   begin
      if H = 0 then
         LH := 1.0;
      end if;
      glViewport (0, 0, GLsizei (LW), GLsizei (LH));
      glMatrixMode (GL_PROJECTION);
      glLoadIdentity;

      if LW <= LH then
         glOrtho (-1.5, 1.5, -1.5 * LH/LW, 1.5 * LH/LW, -10.0, 10.0);
      else
         glOrtho (-1.5 * LW/LH, 1.5 * LW/LH, -1.5, 1.5, -10.0, 10.0);
      end if;

      glMatrixMode (GL_MODELVIEW);
      glLoadIdentity;
   end MyReshape;

   procedure Display is
   begin
      glClear (GL_COLOR_BUFFER_BIT + GL_DEPTH_BUFFER_BIT);
      auxSolidSphere (1.2);
      glFlush;
   end Display;

begin
   auxInitDisplayMode (AUX_SINGLE + AUX_RGB + AUX_DEPTH16);
   auxInitPosition (0, 0, 500, 500);
   Res := auxInitWindow (Window_Name (Window_Name''First));
   MyInit;
   auxReshapeFunc (MyReshape''Unrestricted_Access);
   auxMainLoop (Display''Unrestricted_Access);
end Light;'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a27_bezmesh [
	"from http://www.adapower.com/index.php?Command=Class&ClassID=AdaGraphics&Title=Graphics+Examples"
	"without 'aliased' and procedure_specifications"
	
	^'with Interfaces.C;

with Win32.Gl;

with Win32.Glu;

with Win32.Glaux;

with Defines;



procedure BezMesh is



   use Win32.Gl;

   use Win32.Glu;

   use Win32.Glaux;

   use Interfaces;

   use Defines;



   Window_Name : C.char_array :=

     C.To_C ("Lighted and Filled Bezier Surface");

   Res : GLenum;


   pragma Convention (Stdcall, MyReshape);

   pragma Convention (Stdcall, Display);





   Ctrlpoints : GLmatrix_3 := (((-1.5, -1.5, 4.0), (-0.5, -1.5, 2.0),

                                (0.5, -1.5, -1.0), (1.5, -1.5, 2.0)),



                               ((-1.5, -0.5, 1.0), (-0.5, -0.5, 3.0),

                                (0.5, -0.5, 0.0), (1.5, -0.5, -1.0)),



                               ((-1.5, 0.5, 4.0), (-0.5, 0.5, 0.0),

                                  (0.5, 0.5, 3.0), (1.5, 0.5, 4.0)),



                               ((-1.5, 1.5, -2.0), (-0.5, 1.5, -2.0),

                                (0.5, 1.5, 0.0), (1.5, 1.5, -1.0)));



   procedure InitLights is

      Ambient       : GLvector := (0.2, 0.2, 0.2, 1.0);

      Position      : GLvector := (0.0, 0.0, 2.0, 1.0);

      Mat_Diffuse   : GLvector := (0.6, 0.6, 0.6, 1.0);

      Mat_Specular  : GLvector := (1.0, 1.0, 1.0, 1.0);

      Mat_Shininess : GLfloat := 50.0;

   begin

      glEnable (GL_LIGHTING);

      glEnable (GL_LIGHT0);



      glLightfv (GL_LIGHT0, GL_AMBIENT, Ambient (1)''Unchecked_Access);

      glLightfv (GL_LIGHT0, GL_POSITION, Position (1)''Unchecked_Access);



      glMaterialfv (GL_FRONT, GL_DIFFUSE, Mat_Diffuse (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SPECULAR, Mat_Specular (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SHININESS, Mat_Shininess''Unchecked_Access);

   end InitLights;



   procedure Display is

   begin

      glClear (GL_COLOR_BUFFER_BIT + GL_DEPTH_BUFFER_BIT);

      glPushMatrix;

      glRotatef (85.0, 1.0, 1.0, 1.0);

      glEvalMesh2 (GL_FILL, 0, 20, 0, 20);

      glPopMatrix;

      glFlush;

   end Display;



   procedure MyInit is

   begin

      glClearColor (0.0, 0.0, 0.0, 1.0);

      glEnable (GL_DEPTH_TEST);

      glMap2f (GL_MAP2_VERTEX_3,

               0.0, 1.0, 3, 4,

               0.0, 1.0, 12, 4,

               Ctrlpoints (Ctrlpoints''First (1),

                           Ctrlpoints''First (2),

                           Ctrlpoints''First (3))''Unchecked_Access);

      glEnable (GL_MAP2_VERTEX_3);

      glEnable (GL_AUTO_NORMAL);

      glEnable (GL_NORMALIZE);

      glMapGrid2f (20, 0.0, 1.0, 20, 0.0, 1.0);

      InitLights;

   end MyInit;



   procedure MyReshape (W, H : in GLsizei) is

      Lh : GLsizei;

   begin

      if H = 0 then

         Lh := 1;

      else

         Lh := H;

      end if;

      glViewport (0, 0, W, Lh);

      glMatrixMode (GL_PROJECTION);

      glLoadIdentity;

      if W <= H then

         glOrtho (-4.0, 4.0, -4.0* GLdouble (Lh)/ GLdouble (W),

                  4.0* GLdouble (Lh) / GLdouble (W), -4.0, 4.0);

      else

         glOrtho (-4.0* GLdouble (W) / GLdouble (Lh),

                  4.0* GLdouble (W) / GLdouble (Lh), -4.0, 4.0, -4.0, 4.0);

      end if;

      glMatrixMode (GL_MODELVIEW);

      glLoadIdentity;

   end MyReshape;



begin

   auxInitDisplayMode (AUX_SINGLE + AUX_RGB + AUX_DEPTH16);

   auxInitPosition (0, 0, 500, 500);

   Res := auxInitWindow (Window_Name (Window_Name''First)''Unchecked_Access);

   MyInit;

   auxReshapeFunc (MyReshape''Unrestricted_Access);

   auxMainLoop (Display''Unrestricted_Access);

end BezMesh;

'
]

{ #category : #runningFullGrammar }
AdaTestSample class >> a28_bezsurf [
	"from http://www.adapower.com/index.php?Command=Class&ClassID=AdaGraphics&Title=Graphics+Examples"
	"without 'aliased' and procedure_specifications"
	
	^'with Interfaces.C;

with Win32.Gl;

with Win32.Glu;

with Win32.Glaux;

with Defines;



procedure BezSurf is



   use Win32.Gl;

   use Win32.Glu;

   use Win32.Glaux;

   use Interfaces;

   use Defines;



   Window_Name : C.char_array := C.To_C ("Wireframe Bezier Surface");

   Res : GLenum;

   pragma Convention (Stdcall, MyReshape);

   pragma Convention (Stdcall, Display);



   Ctrlpoints : GLmatrix_3 := (((-1.5, -1.5, 4.0), (-0.5, -1.5, 2.0),

                                (0.5, -1.5, -1.0), (1.5, -1.5, 2.0)),



                               ((-1.5, -0.5, 1.0), (-0.5, -0.5, 3.0),

                                (0.5, -0.5, 0.0), (1.5, -0.5, -1.0)),



                               ((-1.5, 0.5, 4.0), (-0.5, 0.5, 0.0),

                                (0.5, 0.5, 3.0), (1.5, 0.5, 4.0)),



                               ((-1.5, 1.5, -2.0), (-0.5, 1.5, -2.0),

                                (0.5, 1.5, 0.0), (1.5, 1.5, -1.0)));



   procedure Display is

   begin

      glClear (GL_COLOR_BUFFER_BIT + GL_DEPTH_BUFFER_BIT);

      glColor3f (1.0, 1.0, 1.0);

      glPushMatrix;

      glRotatef (85.0, 1.0, 1.0, 1.0);



      for J in 0 .. 8 loop



         glBegin (GL_LINE_STRIP);

         for I in 0 .. 30 loop

            glEvalCoord2f (GLfloat (I) / 30.0, GLfloat (J) / 8.0);

         end loop;

         glEnd;



         glBegin (GL_LINE_STRIP);

         for I in 0 .. 30 loop

            glEvalCoord2f (GLfloat (J) / 8.0, GLfloat (I) / 30.0);

         end loop;

         glEnd;



      end loop;



      glPopMatrix;

      glFlush;

   end Display;



   procedure MyInit is

   begin

      glClearColor (0.0, 0.0, 0.0, 1.0);

      glMap2f (GL_MAP2_VERTEX_3,

               0.0, 1.0, 3, 4,

               0.0, 1.0, 12, 4,

               Ctrlpoints (Ctrlpoints''First (1),

                           Ctrlpoints''First (2),

                           Ctrlpoints''First (3))''Unchecked_Access);

      glEnable (GL_MAP2_VERTEX_3);

      glMapGrid2f (20, 0.0, 1.0, 20, 0.0, 1.0);

      glEnable (GL_DEPTH_TEST);

      glShadeModel (GL_FLAT);

   end MyInit;



   procedure MyReshape (W, H : in GLsizei) is

      Lh : GLsizei;

   begin

      if H = 0 then

         Lh := 1;

      else

         Lh := H;

      end if;

      glViewport (0, 0, W, Lh);

      glMatrixMode (GL_PROJECTION);

      glLoadIdentity;

      if W <= H then

         glOrtho (-4.0, 4.0, -4.0* GLdouble (Lh)/ GLdouble (W),

                  4.0* GLdouble (Lh)/ GLdouble (W), -4.0, 4.0);

      else

         glOrtho (-4.0* GLdouble (W) / GLdouble (Lh),

                  4.0* GLdouble (W) / GLdouble (Lh), -4.0, 4.0, -4.0, 4.0);

      end if;

      glMatrixMode (GL_MODELVIEW);

      glLoadIdentity;

   end MyReshape;





begin

   auxInitDisplayMode (AUX_SINGLE + AUX_RGB + AUX_DEPTH16);

   auxInitPosition (0, 0, 500, 500);

   Res := auxInitWindow (Window_Name (Window_Name''First)''Unchecked_Access);

   MyInit;

   auxReshapeFunc (MyReshape''Unrestricted_Access);

   auxMainLoop (Display''Unrestricted_Access);

end BezSurf;'
]

{ #category : #Gnat2013 }
AdaTestSample class >> a4gAdebug [

^ 
'------------------------------------------------------------------------------
--                                                                          --
--                 ASIS-for-GNAT IMPLEMENTATION COMPONENTS                  --
--                                                                          --
--                           A 4 G . A _ D E B U G                          --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--            Copyright (C) 1995-2013, Free Software Foundation, Inc.       --
--                                                                          --
-- ASIS-for-GNAT is free software; you can redistribute it and/or modify it --
-- under terms of the  GNU General Public License  as published by the Free --
-- Software Foundation;  either version 2,  or  (at your option)  any later --
-- version. ASIS-for-GNAT is distributed  in the hope  that it will be use- --
-- ful, but WITHOUT ANY WARRANTY; without even the implied warranty of MER- --
-- CHANTABILITY or  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General  --
-- Public License for more details. You should have received a copy of the  --
-- GNU General Public License  distributed with ASIS-for-GNAT; see file     --
-- COPYING. If not, write to the Free Software Foundation,  59 Temple Place --
-- - Suite 330,  Boston, MA 02111-1307, USA.                                --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
-- ASIS-for-GNAT was originally developed  by the ASIS-for-GNAT team at the --
-- Software  Engineering  Laboratory  of  the Swiss  Federal  Institute  of --
-- Technology (LGL-EPFL) in Lausanne,  Switzerland, in cooperation with the --
-- Scientific  Research  Computer  Center of  Moscow State University (SRCC --
-- MSU), Russia,  with funding partially provided  by grants from the Swiss --
-- National  Science  Foundation  and  the  Swiss  Academy  of  Engineering --
-- Sciences.  ASIS-for-GNAT is now maintained by AdaCore                    --
-- (http://www.adacore.com).                                                --
--                                                                          --
------------------------------------------------------------------------------

package body A4G.A_Debug is

   ---------------------------------
   -- Summary of Debug Flag Usage --
   ---------------------------------

   --  da   Generate messages when working with normalized associations
   --  db
   --  dc   Generate messages from Context Table during finalization
   --  dd   Dynamic allocation of tables messages generated
   --  de
   --  df
   --  dg
   --  dh
   --  di   Turns off including the Element location into its Debug_Image
   --  dj
   --  dk
   --  dl   Generate debug output when converting node lists into element lists
   --  dm
   --  dn   Generate messages for list allocation
   --  do   Generate messages when opening a Context
   --  dp
   --  dq
   --  dr
   --  ds   All the debug output related to the semantic queries
   --  dt   Generate messages when a tree file is read in
   --  du
   --  dv   Generate messages when checking the validity of ASIS abstractions
   --  dw
   --  dx   Generate debug messages from inside Asis.Text routines
   --  dy
   --  dz

   --  d1   Generate the debug output for tree fragments being traversed
   --  d2
   --  d3
   --  d4
   --  d5
   --  d6
   --  d7
   --  d8
   --  d9

   ----------------------------------------
   -- Documentation for ASIS Debug Flags --
   ----------------------------------------

   --  da   When a list of normalized ASIS association elements is created
   --       or a normalized association is further decomposed, messages
   --       representing some "control points" of this process are generated.
   --
   --  db
   --  dc   When ASIS implementation is finalized (by calling to
   --       A4G.Finalize), the content of the main
   --       Context Table and its subtables is outputted

   --  dd   Dynamic allocation of tables messages generated. Each time a
   --       table is reallocated, a line is output indicating the expansion.

   --  de
   --  df
   --  dg
   --  dh   In GNAT this flag generates a table at the end of a compilation
   --       showing how the hash table chains built by the Namet package are
   --       loaded. This is useful in ensuring that the hashing algorithm
   --       (in Namet.Hash) is working effectively with typical sets of
   --       program identifiers. In ASIS the corresponding feature is not
   --       implemented yet. The idea is to see if the hashing algorithm
   --       is working effectively with the typical set of normalized
   --       unit names

   --  di   Turns off including the Element location into its Debug_Image,
   --       this is helpful when Asis.Text queries do not work properly
   --       because of structural queries misfunction.

   --  dj
   --  dk
   --  dl   Generate debug output when converting node lists into element
   --       lists. For every tree node traversing during the list conversion
   --       some information about the node is outputted
   --  dm
   --  dn   Generate messages for list allocation. Each time a list header is
   --       allocated, a line of output is generated.

   --  do   Generate messages when opening a Context in
   --       "use pre-created trees" mode
   --  dp
   --  dq
   --  dr
   --  ds   Various debug messages related to the semantic queries
   --       implemented for now are generated

   --  dt   Generate messages when a tree file is read in during processing
   --       ASIS queries
   --  du
   --  dv   Generate messages when checking the validity of ASIS Elements,
   --       Compilation_Units, Contexts. The idea is to show, why a given
   --       ASIS abstraction is considered as being invalid

   --  dw
   --  dx   Generate debug messages from inside the routines involved in the
   --       implementation of Asis.Text
   --  dy
   --  dz

   --  d1   Generate the debug output for tree fragments being traversed
   --       when processing ASIS queries (usually - the subtrees rooted by
   --       argument''s pr result''s node)
   --
   --  d2
   --  d3
   --  d4
   --  d5
   --  d6
   --  d7
   --  d8
   --  d9

   --------------------
   -- Set_Debug_Flag --
   --------------------

   procedure Set_Debug_Flag (C : Character; Val : Boolean := True) is
      subtype Dig is Character range ''1'' .. ''9'';
      subtype Let is Character range ''a'' .. ''z'';

   begin
      if C in Dig then
         case Dig''(C) is
            when ''1'' => Debug_Flag_1 := Val;
            when ''2'' => Debug_Flag_2 := Val;
            when ''3'' => Debug_Flag_3 := Val;
            when ''4'' => Debug_Flag_4 := Val;
            when ''5'' => Debug_Flag_5 := Val;
            when ''6'' => Debug_Flag_6 := Val;
            when ''7'' => Debug_Flag_7 := Val;
            when ''8'' => Debug_Flag_8 := Val;
            when ''9'' => Debug_Flag_9 := Val;
         end case;

      else
         case Let''(C) is
            when ''a'' => Debug_Flag_A := Val;
            when ''b'' => Debug_Flag_B := Val;
            when ''c'' => Debug_Flag_C := Val;
            when ''d'' => Debug_Flag_D := Val;
            when ''e'' => Debug_Flag_E := Val;
            when ''f'' => Debug_Flag_F := Val;
            when ''g'' => Debug_Flag_G := Val;
            when ''h'' => Debug_Flag_H := Val;
            when ''i'' => Debug_Flag_I := Val;
            when ''j'' => Debug_Flag_J := Val;
            when ''k'' => Debug_Flag_K := Val;
            when ''l'' => Debug_Flag_L := Val;
            when ''m'' => Debug_Flag_M := Val;
            when ''n'' => Debug_Flag_N := Val;
            when ''o'' => Debug_Flag_O := Val;
            when ''p'' => Debug_Flag_P := Val;
            when ''q'' => Debug_Flag_Q := Val;
            when ''r'' => Debug_Flag_R := Val;
            when ''s'' => Debug_Flag_S := Val;
            when ''t'' => Debug_Flag_T := Val;
            when ''u'' => Debug_Flag_U := Val;
            when ''v'' => Debug_Flag_V := Val;
            when ''w'' => Debug_Flag_W := Val;
            when ''x'' => Debug_Flag_X := Val;
            when ''y'' => Debug_Flag_Y := Val;
            when ''z'' => Debug_Flag_Z := Val;
         end case;
      end if;
   end Set_Debug_Flag;

   -------------
   -- Set_Off --
   -------------

   procedure Set_Off is
   begin
      Debug_Flag_1 := False;
      Debug_Flag_2 := False;
      Debug_Flag_3 := False;
      Debug_Flag_4 := False;
      Debug_Flag_5 := False;
      Debug_Flag_6 := False;
      Debug_Flag_7 := False;
      Debug_Flag_8 := False;
      Debug_Flag_9 := False;

      Debug_Flag_A := False;
      Debug_Flag_B := False;
      Debug_Flag_C := False;
      Debug_Flag_D := False;
      Debug_Flag_E := False;
      Debug_Flag_F := False;
      Debug_Flag_G := False;
      Debug_Flag_H := False;
      Debug_Flag_I := False;
      Debug_Flag_J := False;
      Debug_Flag_K := False;
      Debug_Flag_L := False;
      Debug_Flag_M := False;
      Debug_Flag_N := False;
      Debug_Flag_O := False;
      Debug_Flag_P := False;
      Debug_Flag_Q := False;
      Debug_Flag_R := False;
      Debug_Flag_S := False;
      Debug_Flag_T := False;
      Debug_Flag_U := False;
      Debug_Flag_V := False;
      Debug_Flag_W := False;
      Debug_Flag_X := False;
      Debug_Flag_Y := False;
      Debug_Flag_Z := False;

      Debug_Mode   := False;
      Debug_Lib_Model := False; -- TEMPORARY SOLUTION, SHOULD BE DROPPED!!!
   end Set_Off;

   ------------
   -- Set_On --
   ------------

   procedure Set_On is
   begin
      Debug_Flag_1 := True;
      Debug_Flag_2 := True;
      Debug_Flag_3 := True;
      Debug_Flag_4 := True;
      Debug_Flag_5 := True;
      Debug_Flag_6 := True;
      Debug_Flag_7 := True;
      Debug_Flag_8 := True;
      Debug_Flag_9 := True;

      Debug_Flag_A := True;
      Debug_Flag_B := True;
      Debug_Flag_C := True;
      Debug_Flag_D := True;
      Debug_Flag_E := True;
      Debug_Flag_F := True;
      Debug_Flag_G := True;
      Debug_Flag_H := True;
      Debug_Flag_I := True;
      Debug_Flag_J := True;
      Debug_Flag_K := True;
      Debug_Flag_L := True;
      Debug_Flag_M := True;
      Debug_Flag_N := True;
      Debug_Flag_O := True;
      Debug_Flag_P := True;
      Debug_Flag_Q := True;
      Debug_Flag_R := True;
      Debug_Flag_S := True;
      Debug_Flag_T := True;
      Debug_Flag_U := True;
      Debug_Flag_V := True;
      Debug_Flag_W := True;
      Debug_Flag_X := True;
      Debug_Flag_Y := True;
      Debug_Flag_Z := True;

      Debug_Mode      := True; -- TEMPORARY SOLUTION, SHOULD BE DROPPED!!!
      Debug_Lib_Model := True; -- TEMPORARY SOLUTION, SHOULD BE DROPPED!!!
   end Set_On;

end A4G.A_Debug;
'
]

{ #category : #Gnat2013 }
AdaTestSample class >> a4gitests [
^
'with Types; use Types;

package A4G.Itests is

  function Is_Inherited_Discriminant (N : Node_Id) return Boolean;
  --  Tests if N corresponds to the defining occurrence of an inherited
  --  discriminant. N should be of N_Defining_Identifier kind
  --
  --  INCOMPLETE and INRELIABLE for now!

  function Is_From_Instance (N : Node_Id) return Boolean;
  --  Tests if N corresponds to an implicit or explicit construction from
  --  the result of some generic instantiation (that is, from an expanded
  --  generic template)

end A4G.Itests;'


]

{ #category : #'addit. webexamples' }
AdaTestSample class >> accum [
	"from http://www.adapower.com/index.php?Command=Class&ClassID=AdaGraphics&Title=Graphics+Examples"
	"without 'aliased' and procedure_specifications"
	
	^'
with Win32.Gl;

with Win32.Glu;

with Win32.Glaux;

with Interfaces.C;

with Interfaces.C.Strings;

with Defines;



procedure Accum is



   use Win32.Gl;

   use Win32.Glu;

   use Win32.Glaux;

   use Interfaces;

   use Defines;


   Res : GLenum;

   pragma Convention (Stdcall, MyReshape);

   pragma Convention (Stdcall, Display);





   Width, Height : GLsizei;





   procedure MyInit is



      Ambient        : GLvector := (0.4, 0.4, 0.4, 1.0);

      Diffuse        : GLvector := (1.0, 1.0, 1.0, 1.0);

      Specular       : GLvector := (1.0, 1.0, 1.0, 1.0);

      Position       : GLvector := (0.0, 2.0, 2.0, 0.0);

      Mat_Ambient    : GLvector := (0.2, 0.2, 0.2, 1.0);

      Mat_Diffuse    : GLvector := (0.7, 0.7, 0.7, 1.0);

      Mat_Specular   : GLvector := (0.9, 0.9, 0.9, 1.0);

      Mat_Shininess  : GLfloat := 50.0;

      Lmodel_Ambient : GLvector := (0.2, 0.2, 0.2, 1.0);



   begin

      glEnable (GL_DEPTH_TEST);

      glDepthFunc (GL_LESS);



      glLightfv (GL_LIGHT0, GL_AMBIENT, Ambient (1)''Unchecked_Access);

      glLightfv (GL_LIGHT0, GL_DIFFUSE, Diffuse (1)''Unchecked_Access);

      glLightfv (GL_LIGHT0, GL_SPECULAR, Specular (1)''Unchecked_Access);

      glLightfv (GL_LIGHT0, GL_POSITION, Position (1)''Unchecked_Access);



      glMaterialfv (GL_FRONT, GL_AMBIENT, Mat_Ambient (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_DIFFUSE, Mat_Diffuse (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SPECULAR, Mat_Specular (1)''Unchecked_Access);

      glMaterialfv (GL_FRONT, GL_SHININESS,

                    Mat_Shininess''Unchecked_Access);



      glLightModelfv (GL_LIGHT_MODEL_AMBIENT,

                      Lmodel_Ambient (1)''Unchecked_Access);



      glEnable (GL_LIGHTING);

      glEnable (GL_LIGHT0);

      glEnable (GL_AUTO_NORMAL);

      glEnable (GL_NORMALIZE);



      glEnable (GL_CULL_FACE);

      glCullFace (GL_FRONT);



      glClearAccum (0.0, 0.0, 0.0, 0.0);

   end MyInit;



   ACSIZE : constant := 16;



   Dx : GLvector (1 .. ACSIZE);

   Dy : GLvector (1 .. ACSIZE);



   Jitter3 : GLmatrix := ((0.5, 0.5),

                          (1.35899e-05, 0.230369),

                          (0.000189185, 0.766878));



   Jitter11 : GLmatrix := ((0.5, 0.5), (0.406537, 0.135858),

                           (0.860325, 0.968558), (0.680141, 0.232877),

                           (0.775694, 0.584871), (0.963354, 0.309056),

                           (0.593493, 0.864072), (0.224334, 0.415055),

                           (0.0366643, 0.690884), (0.139685, 0.0313988),

                           (0.319861, 0.767097));



   Jitter16 : GLmatrix := ((0.4375, 0.4375), (0.1875, 0.5625),

                           (0.9375, 1.1875), (0.4375, 0.9375 - 1.0),

                           (0.6875, 0.5625), (0.1875, 0.0625),

                           (0.6875, 0.3125), (0.1875, 0.3125),

                           (0.4375, 0.1875), (0.9375 - 1.0, 0.4375),

                           (0.6875, 0.8125), (0.4375, 0.6875),

                           (0.6875, 0.0625), (0.9375, 0.9375),

                           (1.1875, 0.8125), (0.9375, 0.6875));



   Jitter29 : GLmatrix := ((0.5, 0.5), (0.498126, 0.141363),

                           (0.217276, 0.651732), (0.439503, 0.954859),

                           (0.734171, 0.836294), (0.912454, 0.79952),

                           (0.406153, 0.671156), (0.0163892, 0.631994),

                           (0.298064, 0.843476), (0.312025, 0.0990405),

                           (0.98135, 0.965697), (0.841999, 0.272378),

                           (0.559348, 0.32727), (0.809331, 0.638901),

                           (0.632583, 0.994471), (0.00588314, 0.146344),

                           (0.713365, 0.437896), (0.185173, 0.246584),

                           (0.901735, 0.474544), (0.366423, 0.296698),

                           (0.687032, 0.188184), (0.313256, 0.472999),

                           (0.543195, 0.800044), (0.629329, 0.631599),

                           (0.818263, 0.0439354), (0.163978, 0.00621497),

                           (0.109533, 0.812811), (0.131325, 0.471624),

                           (0.0196755, 0.331813));



   Jitter90 : GLmatrix := ((0.5, 0.5), (0.784289, 0.417355),

                           (0.608691, 0.678948), (0.546538, 0.976002),

                           (0.972245, 0.270498), (0.765121, 0.189392),

                           (0.513193, 0.743827), (0.123709, 0.874866),

                           (0.991334, 0.745136), (0.56342, 0.0925047),

                           (0.662226, 0.143317), (0.444563, 0.928535),

                           (0.248017, 0.981655), (0.100115, 0.771923),

                           (0.593937, 0.559383), (0.392095, 0.225932),

                           (0.428776, 0.812094), (0.510615, 0.633584),

                           (0.836431, 0.00343328), (0.494037, 0.391771),

                           (0.617448, 0.792324), (0.688599, 0.48914),

                           (0.530421, 0.859206), (0.0742278, 0.665344),

                           (0.979388, 0.626835), (0.183806, 0.479216),

                           (0.151222, 0.0803998), (0.476489, 0.157863),

                           (0.792675, 0.653531), (0.0990416, 0.267284),

                           (0.776667, 0.303894), (0.312904, 0.296018),

                           (0.288777, 0.691008), (0.460097, 0.0436075),

                           (0.594323, 0.440751), (0.876296, 0.472043),

                           (0.0442623, 0.0693901), (0.355476, 0.00442787),

                           (0.391763, 0.361327), (0.406994, 0.696053),

                           (0.708393, 0.724992), (0.925807, 0.933103),

                           (0.850618, 0.11774), (0.867486, 0.233677),

                           (0.208805, 0.285484), (0.572129, 0.211505),

                           (0.172931, 0.180455), (0.327574, 0.598031),

                           (0.685187, 0.372379), (0.23375, 0.878555),

                           (0.960657, 0.409561), (0.371005, 0.113866),

                           (0.29471, 0.496941), (0.748611, 0.0735321),

                           (0.878643, 0.34504), (0.210987, 0.778228),

                           (0.692961, 0.606194), (0.82152, 0.8893),

                           (0.0982095, 0.563104), (0.214514, 0.581197),

                           (0.734262, 0.956545), (0.881377, 0.583548),

                           (0.0560485, 0.174277), (0.0729515, 0.458003),

                           (0.719604, 0.840564), (0.325388, 0.7883),

                           (0.26136, 0.0848927), (0.393754, 0.467505),

                           (0.425361, 0.577672), (0.648594, 0.0248658),

                           (0.983843, 0.521048), (0.272936, 0.395127),

                           (0.177695, 0.675733), (0.89175, 0.700901),

                           (0.632301, 0.908259), (0.782859, 0.53611),

                           (0.0141421, 0.855548), (0.0437116, 0.351866),

                           (0.939604, 0.0450863), (0.0320883, 0.962943),

                           (0.341155, 0.895317), (0.952087, 0.158387),

                           (0.908415, 0.820054), (0.481435, 0.281195),

                           (0.675525, 0.25699), (0.585273, 0.324454),

                           (0.156488, 0.376783), (0.140434, 0.977416),

                           (0.808155, 0.77305), (0.282973, 0.188937));



   procedure LoadDxDy is

   begin

      for I in Dx''Range loop

         Dx (I) := Jitter16 (I, 1) * 10.0 / GLfloat (Width);

         Dy (I) := Jitter16 (I, 2) * 10.0 / GLfloat (Height);

      end loop;

   end LoadDxDy;



   procedure Display is

   begin

      glClear (GL_ACCUM_BUFFER_BIT);

      LoadDxDy;

      for I in Dx''Range loop

         glPushMatrix;

         glTranslatef (Dx (I), Dy (I), 0.0);

         glRotatef (45.0, 1.0, 1.0, 1.0);

         glClear (GL_DEPTH_BUFFER_BIT + GL_COLOR_BUFFER_BIT);

         auxSolidTeapot (1.0);

         glPopMatrix;

         glAccum (GL_ACCUM, 1.0 / GLfloat (ACSIZE));

      end loop;



      glAccum (GL_RETURN, 1.0);



      glFlush;

   end Display;



   procedure MyReshape (W, H : GLsizei) is

      Lh : GLsizei;

   begin

      if H = 0 then

         Lh := 1;

      else

         Lh := H;

      end if;

      Width := W; Height := Lh;

      glViewport (0, 0, W, H);

      glMatrixMode (GL_PROJECTION);

      glLoadIdentity;

      if W <= H then

         glOrtho (-3.0, 3.0, -3.0*GLdouble (Lh) /GLdouble (W),

                  3.0*GLdouble (Lh) /GLdouble (W), -15.0, 15.0);

      else

         glOrtho (-3.0*GLdouble (W) /GLdouble (Lh),

                  3.0*GLdouble (W) /GLdouble (Lh), -3.0, 3.0, -15.0, 15.0);

      end if;

      glMatrixMode (GL_MODELVIEW);

      glLoadIdentity;

   end MyReshape;





begin

   auxInitDisplayMode (AUX_SINGLE + AUX_RGB + AUX_ACCUM + AUX_DEPTH16);

   auxInitPosition (0, 0, 300, 300);



   Res := auxInitWindow (Window_Name (Window_Name''First)''Unchecked_Access);

   MyInit;

   auxReshapeFunc (MyReshape''Unrestricted_Access);

   auxMainLoop (Display''Unrestricted_Access);

end Accum;

'
]

{ #category : #'addit. arts' }
AdaTestSample class >> bufferAdb [
	
	^'

with Linked_List;
with UNCHECKED_DEALLOCATION;

Package body Intertask_buffer is


  Task Buffer is
    entry Put_at_beginning_total   (In_data          : in Element);
    entry Get_from_beginning_total (Out_data         : out Element);
    entry Put_at_end_total         (In_data          : in Element);
    entry Get_from_end_total       (Out_data         : out Element);
    entry Examine_beginning_total  (Out_data         : out Element);
    entry Examine_end_total        (Out_data         : out Element);
    entry Put_at_beginning         (In_data          : in Element;
                                    The_priority     : in Priority);
    entry Get_from_beginning       (Out_data         :    out Element;
                                    The_priority     : in     Priority);
    entry Put_at_end               (In_data          : in Element;
                                    The_priority     : in Priority);
    entry Get_from_end             (Out_data         :    out Element;
                                    The_priority     : in     Priority);
    entry Examine_beginning        (Out_data         :     out Element;
                                    The_priority     : in      Priority);
    entry Examine_end              (Out_data         :    out Element;
                                    The_priority     : in     Priority);
    entry Get_buffer_count_total   (Out_count : out NATURAL;
                                    Max_count  : out NATURAL);
    entry Get_buffer_count         (Out_count   :    out NATURAL;
                                    Total_count  :    out NATURAL;
                                    Max_count    :    out NATURAL;
                                    The_priority : in     Priority);
    entry Set_buffer_size          (New_buffer_size  : in POSITIVE);
  end Buffer;

  Procedure Put_at_beginning (In_data : in Element) is
  begin 
    Buffer.Put_at_beginning_total (In_data => In_data);
  end Put_at_beginning;

  Procedure Put_at_end (In_data : in Element) is
  begin 
    Buffer.Put_at_end_total (In_data => In_data);
  end Put_at_end;

  Procedure Get_from_beginning (Out_data : out Element) is
  begin 
    Buffer.Get_from_beginning_total (Out_data => Out_data);
  end Get_from_beginning;

  Procedure Get_from_end (Out_data : out Element) is
  begin 
    Buffer.Get_from_end_total (Out_data => Out_data);
  end Get_from_end;

  Procedure Examine_beginning (Out_data : out Element) is
  begin 
    Buffer.Examine_beginning_total (Out_data => Out_data);
  end Examine_beginning;

  Procedure Examine_end (Out_data : out Element) is
  begin 
    Buffer.Examine_end_total (Out_data => Out_data);
  end Examine_end;


  Procedure Put_at_beginning (In_data      : in Element;
                              The_priority : in Priority) is
  begin 
    Buffer.Put_at_beginning  (In_data      => In_data,
                              The_priority => The_priority);
  end Put_at_beginning;

  Procedure Put_at_end (In_data      : in Element;
                        The_priority : in Priority) is
  begin 
    Buffer.Put_at_end  (In_data      => In_data,
                        The_priority => The_priority);
  end Put_at_end;

  Procedure Get_from_beginning (Out_data     :    out Element;
                                The_priority : in     Priority) is
  begin 
    Buffer.Get_from_beginning  (Out_data     => Out_data,
                                The_priority => The_priority);
  end Get_from_beginning;

  Procedure Get_from_end (Out_data     :    out Element;
                          The_priority : in     Priority) is
  begin 
    Buffer.Get_from_end  (Out_data     => Out_data,
                          The_priority => The_priority);
  end Get_from_end;

  Procedure Examine_beginning (Out_data     :    out Element;
                               The_priority : in     Priority) is
  begin 
    Buffer.Examine_beginning  (Out_data     => Out_data,
                               The_priority => The_priority);
  end Examine_beginning;

  Procedure Examine_end (Out_data     :    out Element;
                         The_priority : in     Priority) is
  begin 
    Buffer.Examine_end  (Out_data     => Out_data,
                         The_priority => The_priority);
  end Examine_end;

  Procedure Set_buffer_size (Buffer_size  : in POSITIVE) is
  begin 
    Buffer.Set_buffer_size  (New_buffer_size => Buffer_size);
  end Set_buffer_size;

  Function Quick_buffer_status return Status_value is
    Current_count : NATURAL;
    Max_count     : NATURAL;
  begin 
    Buffer.Get_buffer_count_total (Out_count => Current_count,
                                   Max_count => Max_count);
    if Current_count = Max_count then
      return full;
    elsif Current_count = 0 then
      return empty;
    else
      return partially_full;
    end if;
  end Quick_buffer_status;

  Procedure Buffer_status (Out_Count  : out NATURAL;
                           Out_status : out Status_value) is
    Current_count : NATURAL;
    Max_count     : NATURAL;
  begin 
    Buffer.Get_buffer_count_total (Out_count => Current_count,
                                   Max_count => Max_count);
    Out_count := Current_count;
    if Current_count = Max_count then
      Out_status := full;
    elsif Current_count = 0 then
      Out_status := empty;
    else
      Out_status := partially_full;
    end if;
  end Buffer_status;

  Procedure Quick_buffer_status (The_priority    : in     Priority;
                                 Priority_status :    out Status_value;
                                 Overall_status  :    out Status_value) is
    Current_count : NATURAL;
    Whole_count   : NATURAL;
    Max_count     : NATURAL;
    Total_status  : Status_value;
  begin 
    Buffer.Get_buffer_count (Out_count    => Current_count,
                             Total_count  => Whole_count,
                             Max_count    => Max_count,
                             The_priority => The_priority);
    if Whole_count = Max_count then
      Total_status := full;
    elsif Whole_count = 0 then
      Total_status := empty;
    else
      Total_status := partially_full;
    end if;
    if Total_status = full then
      Priority_status := full;
    elsif Current_count = 0 then
      Priority_status := empty;
    else
      Priority_status := partially_full;
    end if;
    Overall_status := Total_status;
  end Quick_buffer_status;

  Procedure Buffer_status (The_priority   : in     Priority;
                           Out_Count      :    out NATURAL;
                           Out_status     :    out Status_value;
                           Overall_count  :    out NATURAL;
                           Overall_status :    out Status_value) is
    Current_count : NATURAL;
    Whole_count   : NATURAL;
    Max_count     : NATURAL;
    Total_status  : Status_value;
  begin 
    Buffer.Get_buffer_count (Out_count    => Current_count,
                             Total_count  => Whole_count,
                             Max_count    => Max_count,
                             The_priority => The_priority);
    Out_count := Current_count;
    Overall_count := Whole_count;
    if Whole_count = Max_count then
      Total_status := full;
    elsif Whole_count = 0 then
      Total_status := empty;
    else
      Total_status := partially_full;
    end if;
    if Total_status = full then
      Out_status := full;
    elsif Current_count = 0 then
      Out_status := empty;
    else
      Out_status := partially_full;
    end if;
    Overall_status := Total_status;
  end Buffer_status;


  Task body Buffer is

    type Element_access is access Element;

    Package Buffer_list is new Linked_List (ITEM_TO_MANAGE =>
                                                           Element_access,
                                            Illegal_value  => null);

    use Buffer_list;           

    Procedure Dispose_element is new UNCHECKED_DEALLOCATION (OBJECT =>
                                                           Element,
                                                             NAME   =>
                                                           Element_access);

    The_total_buffer  : Buffer_list.List_Node;
    Empty_pointer     : constant Buffer_list.List_Node :=
                                                     Buffer_list.Empty_Node;
    Buffer_beginning  : array (Priority) of Buffer_list.List_Node;
    Buffer_end        : array (Priority) of Buffer_list.List_Node;
    This_priority     : Priority;
    Overall_count     : NATURAL := 0;
    Count             : array (Priority) of NATURAL := (others => 0);
    Total_buffer_size : NATURAL;
    Max_buffer_size   : POSITIVE := Buffer_size;

  Procedure Put_at_buffer_beginning (The_element : in Element;
                                     The_buffer  : in Priority) is
    Previous_node,
    New_node        : Buffer_list.List_Node;
    New_element_ptr : Element_access;
    The_priority    : Priority;
  begin 
    New_element_ptr := new Element;
    New_element_ptr.ALL := The_element;
      for Priority_count in The_buffer..Priority''LAST loop
        The_priority := Priority_count;
        exit when Buffer_beginning (Priority_count) /= Empty_pointer;
      end loop;
      if Buffer_beginning (The_priority) = Empty_pointer then
        Buffer_list.Append_Node (To_list   => The_total_buffer,
                                 New_Value => New_element_ptr,
                                 New_Node  => New_node);
      else
        Previous_node := Buffer_list.Travel_Node (From_Node =>
                                           Buffer_beginning (The_priority),
                                                  Do_Forward => FALSE);
        Buffer_list.Insert_Node (To_Node   => Previous_node,
                                 New_Value => New_element_ptr,
                                 New_Node  => New_node);
      end if;
      if count (The_buffer) = 0 then
        Buffer_end (The_buffer) := New_node;
      end if;
    Buffer_beginning (The_buffer) := New_node;
    Count (The_buffer) := Count (The_buffer) + 1;
    Overall_count := Overall_count + 1;
  end Put_at_buffer_beginning;

  Procedure Put_at_buffer_end (The_element : in Element;
                               The_buffer  : in Priority) is
    New_node        : Buffer_list.List_Node;
    New_element_ptr : Element_access;
    The_priority    : Priority;
  begin 
    New_element_ptr := new Element;
    New_element_ptr.ALL := The_element;
    for Priority_count in reverse Priority''FIRST..The_buffer loop
      The_priority := Priority_count;
      exit when Buffer_beginning (Priority_count) /= Empty_pointer;
    end loop;
    if Buffer_end (The_priority) = Empty_pointer then
      Buffer_list.Insert_Node (To_Node   => The_total_buffer,
                               New_Value => New_element_ptr,
                               New_Node  => New_node);
    else
      Buffer_list.Insert_Node (To_Node   => Buffer_end (The_priority),
                               New_Value => New_element_ptr,
                               New_Node  => New_node);
    end if;
    if count (The_buffer) = 0 then
      Buffer_beginning (The_buffer) := New_node;
    end if;
    Buffer_end (The_buffer) := New_node;
    Count (The_buffer) := Count (The_buffer) + 1;
    Overall_count := Overall_count + 1;
  end Put_at_buffer_end;

  Procedure Copy_from_buffer_beginning (The_element :    out Element;
                                        The_buffer  : in     Priority) is
    The_element_ptr : Element_access;
  begin 
    The_element_ptr := Buffer_list.Value (Buffer_beginning (The_buffer));
    The_element := The_element_ptr.ALL;
  end Copy_from_buffer_beginning;

  Procedure Copy_from_buffer_end (The_element :    out Element;
                                  The_buffer  : in     Priority) is
    The_element_ptr : Element_access;
  begin 
    The_element_ptr := Buffer_list.Value (Buffer_end (The_buffer));
    The_element := The_element_ptr.ALL;
  end Copy_from_buffer_end;

  Procedure Get_from_buffer_beginning (The_element :    out Element;
                                       The_buffer  : in     Priority) is
    The_element_ptr : Element_access;
    Next_node       : Buffer_list.List_Node;
  begin 
    The_element_ptr := Buffer_list.Value (Buffer_beginning (The_buffer));
    The_element := The_element_ptr.ALL;
    Dispose_element (The_element_ptr);
    Next_node := Buffer_list.Travel_Node (From_Node  =>
                                             Buffer_beginning (The_buffer),
                                          Do_Forward => TRUE);
    Buffer_list.Delete_Node (The_Node => Buffer_beginning (The_buffer));
    Count (The_buffer) := Count (The_buffer) - 1;
    Overall_count := Overall_count - 1;
    if Count (The_buffer) <= 0 or Next_node = The_total_buffer then
      Buffer_beginning (The_buffer) := Empty_pointer;
      Buffer_end (The_buffer)       := Empty_pointer;
      Count (The_buffer) := 0;
    else
      Buffer_beginning (The_buffer) := Next_node;
    end if;
  end Get_from_buffer_beginning;

  Procedure Get_from_buffer_end (The_element :    out Element;
                                 The_buffer  : in     Priority) is
    The_element_ptr : Element_access;
    Next_node       : Buffer_list.List_Node;
  begin 
    The_element_ptr := Buffer_list.Value (Buffer_end (The_buffer));
    The_element := The_element_ptr.ALL;
    Dispose_element (The_element_ptr);
    Next_node := Buffer_list.Travel_Node (From_Node  =>
                                             Buffer_end (The_buffer),
                                          Do_Forward => FALSE);
    Buffer_list.Delete_Node (The_Node => Buffer_end (The_buffer));
    Count (The_buffer) := Count (The_buffer) - 1;
    Overall_count := Overall_count - 1;
    if Count (The_buffer) <= 0 or Next_node = The_total_buffer then
      Buffer_beginning (The_buffer) := Empty_pointer;
      Buffer_end (The_buffer)       := Empty_pointer;
      Count (The_buffer) := 0;
    else
      Buffer_end (The_buffer) := Next_node;
    end if;
  end Get_from_buffer_end;

 begin  

    Buffer_list.Initialize_List (The_total_buffer);
    for Priority_count in Priority''FIRST..Priority''LAST loop
      Buffer_beginning (Priority_count) := Empty_pointer;
      Buffer_end (Priority_count)       := Empty_pointer;
    end loop;
    Total_buffer_size := Max_buffer_size;
    loop
    BEGIN
      select

        when Overall_count < Total_buffer_size => 
          accept Put_at_beginning_total (In_data : in Element) do
            Put_at_buffer_beginning (The_element => In_data,
                                     The_buffer  => Priority''FIRST);
          end Put_at_beginning_total;                

        or when Overall_count < Total_buffer_size => 
          accept Put_at_end_total (In_data : in Element) do
            Put_at_buffer_end (The_element => In_data,
                               The_buffer  => Priority''LAST);
          end Put_at_end_total;                

        or when Overall_count < Total_buffer_size => 
          accept Put_at_beginning (In_data      : in Element;
                                   The_priority : in Priority) do
            Put_at_buffer_beginning (The_element => In_data,
                                     The_buffer  => The_priority);
          end Put_at_beginning;                

        or when Overall_count < Total_buffer_size => 
          accept Put_at_end (In_data      : in Element;
                             The_priority : in Priority) do
            Put_at_buffer_end (The_element => In_data,
                               The_buffer  => The_priority);
          end Put_at_end;                

        or when (Overall_count > 0) and
             (Overall_count <= Total_buffer_size) => 
          accept Get_from_beginning_total (Out_data : out Element) do
            for Priority_count in Priority''FIRST..Priority''LAST loop
              This_priority := Priority_count;
              exit when Count (Priority_count) > 0;
            end loop;
            Get_from_buffer_beginning (The_element => Out_data,
                                       The_buffer  => This_priority);
            end Get_from_beginning_total;          

        or when (Overall_count > 0) and
             (Overall_count <= Total_buffer_size) => 
          accept Get_from_end_total (Out_data : out Element) do
            for Priority_count in reverse Priority''FIRST..Priority''LAST
                                                                      loop
              This_priority := Priority_count;
              exit when Count (Priority_count) > 0;
            end loop;
            Get_from_buffer_end (The_element => Out_data,
                                 The_buffer  => This_priority);
           end Get_from_end_total;                

        or when (Overall_count > 0) and
             (Overall_count <= Total_buffer_size) => 
          accept Examine_beginning_total (Out_data : out Element) do
            for Priority_count in Priority''FIRST..Priority''LAST loop
              This_priority := Priority_count;
              exit when Count (Priority_count) > 0;
            end loop;
            Copy_from_buffer_beginning (The_element => Out_data,
                                        The_buffer  => This_priority);
            end Examine_beginning_total;             

        or when (Overall_count > 0) and
             (Overall_count <= Total_buffer_size) => 
          accept Examine_end_total (Out_data : out Element) do
            for Priority_count in reverse Priority''FIRST..Priority''LAST
                                                                     loop
              This_priority := Priority_count;
              exit when Count (Priority_count) > 0;
            end loop;
            Copy_from_buffer_end (The_element => Out_data,
                                  The_buffer  => This_priority);
            end Examine_end_total;                

        or when (Overall_count > 0) and
             (Overall_count <= Total_buffer_size) => 
          accept Get_from_beginning (Out_data     : out Element;
                                     The_priority : in Priority) do
            if Count (The_priority) <= 0 then
              raise Buffer_empty;
            else
              Get_from_buffer_beginning (The_element => Out_data,
                                         The_buffer  => The_priority);
            end if;
            end Get_from_beginning;          

        or when (Overall_count > 0) and
             (Overall_count <= Total_buffer_size) => 
          accept Get_from_end (Out_data     : out Element;
                               The_priority : in Priority) do
            if Count (The_priority) <= 0 then
              raise Buffer_empty;
            else
              Get_from_buffer_end (The_element => Out_data,
                                         The_buffer  => The_priority);
            end if;
            end Get_from_end;                

        or when (Overall_count > 0) and
             (Overall_count <= Total_buffer_size) => 
          accept Examine_beginning (Out_data     : out Element;
                                    The_priority : in Priority) do
            if Count (The_priority) <= 0 then
              raise Buffer_empty;
            else
              Copy_from_buffer_beginning (The_element => Out_data,
                                          The_buffer  => The_priority);
            end if;
            end Examine_beginning;                

        or when (Overall_count > 0) and
             (Overall_count <= Total_buffer_size) => 
          accept Examine_end (Out_data     : out Element;
                              The_priority : in Priority) do
            if Count (The_priority) <= 0 then
              raise Buffer_empty;
            else
              Copy_from_buffer_end (The_element => Out_data,
                                    The_buffer  => The_priority);
            end if;
            end Examine_end;                

        or
           accept Get_buffer_count_total (Out_count : out NATURAL;
                                          Max_count : out NATURAL) do
            Out_count := Overall_count;
            Max_count := Max_buffer_size;
            end Get_buffer_count_total;       

        or
          accept Get_buffer_count (Out_count    :    out NATURAL;
                                   Total_count  :    out NATURAL;
                                   Max_count    :    out NATURAL;
                                   The_priority : in     Priority) do
            Out_count   := Count (The_priority);
            Total_count := Overall_count;
            Max_count   := Max_buffer_size;
            end Get_buffer_count;             

        or
          accept Set_buffer_size (New_buffer_size  : in POSITIVE) do
            if Overall_Count > New_buffer_size then
              raise Invalid_buffer_size;
            end if;
            Max_buffer_size := New_buffer_size;
              
            end Set_buffer_size;                

        or terminate;                         

      end select;
            
      exception                               
        when Invalid_buffer_size => null;
        when Buffer_full => null;
        when Buffer_empty => null;
        when others => raise;

    END;
    end loop;

  end Buffer;

begin 
  null;
end Intertask_buffer;


'
]

{ #category : #'addit. arts' }
AdaTestSample class >> bufferAds [
	
	^'generic type Element  is private;
        type Priority is range <>;
        Buffer_size : in POSITIVE := 10;

Package Intertask_buffer is

  type Status_value is (empty, partially_full, full);


  Procedure Put_at_beginning    (In_data  : in Element);

  Procedure Put_at_end          (In_data  : in Element);

  Procedure Get_from_beginning  (Out_data : out Element);

  Procedure Get_from_end        (Out_data : out Element);

  Procedure Examine_beginning   (Out_data : out Element);

  Procedure Examine_end         (Out_data : out Element);

  Function Quick_buffer_status   return Status_value;

  Procedure Buffer_status       (Out_Count : out NATURAL;
                                 Out_status : out Status_value);

  Procedure Set_buffer_size     (Buffer_size  : in POSITIVE);


  Procedure Put_at_beginning    (In_data      : in Element;
                                 The_priority : in Priority);

  Procedure Put_at_end          (In_data      : in Element;
                                 The_priority : in Priority);

  Procedure Get_from_beginning  (Out_data      :    out Element;
                                 The_priority : in     Priority);

  Procedure Get_from_end        (Out_data      :    out Element;
                                 The_priority : in     Priority);

  Procedure Examine_beginning    (Out_data      :    out Element;
                                  The_priority : in     Priority);

  Procedure Examine_end          (Out_data      :    out Element;
                                  The_priority : in     Priority);

  Procedure Quick_buffer_status  (The_priority    : in     Priority;
                                  Priority_status :    out Status_value;
                                  Overall_status  :    out Status_value);

  Procedure Buffer_status        (The_priority   : in     Priority;
                                  Out_Count      :    out NATURAL;
                                  Out_status     :    out Status_value;
                                  Overall_count  :    out NATURAL;
                                  Overall_status :    out Status_value);

  Buffer_full,
  Buffer_empty,
  Invalid_buffer_size  :  exception;

end Intertask_buffer;


'
]

{ #category : #'addit. webexamples' }
AdaTestSample class >> bufferSmall [
	
	^'with Linked_List;
with UNCHECKED_DEALLOCATION;

Package body Intertask_buffer is

  Procedure Put_at_beginning (In_data : in Element) is
  begin 
    Buffer.Put_at_beginning_total (In_data => In_data);
  end Put_at_beginning;

  Procedure Put_at_end (In_data : in Element) is
  begin 
    Buffer.Put_at_end_total (In_data => In_data);
  end Put_at_end;

  Procedure Get_from_beginning (Out_data : out Element) is
  begin 
    Buffer.Get_from_beginning_total (Out_data => Out_data);
  end Get_from_beginning;

  Procedure Get_from_end (Out_data : out Element) is
  begin 
    Buffer.Get_from_end_total (Out_data => Out_data);
  end Get_from_end;

  Procedure Examine_beginning (Out_data : out Element) is
  begin 
    Buffer.Examine_beginning_total (Out_data => Out_data);
  end Examine_beginning;

  Procedure Examine_end (Out_data : out Element) is
  begin 
    Buffer.Examine_end_total (Out_data => Out_data);
  end Examine_end;


  Procedure Put_at_beginning (In_data      : in Element;
                              The_priority : in Priority) is
  begin 
    Buffer.Put_at_beginning  (In_data      => In_data,
                              The_priority => The_priority);
  end Put_at_beginning;

  Procedure Put_at_end (In_data      : in Element;
                        The_priority : in Priority) is
  begin 
    Buffer.Put_at_end  (In_data      => In_data,
                        The_priority => The_priority);
  end Put_at_end;

  Procedure Get_from_beginning (Out_data     :    out Element;
                                The_priority : in     Priority) is
  begin 
    Buffer.Get_from_beginning  (Out_data     => Out_data,
                                The_priority => The_priority);
  end Get_from_beginning;

  Procedure Get_from_end (Out_data     :    out Element;
                          The_priority : in     Priority) is
  begin 
    Buffer.Get_from_end  (Out_data     => Out_data,
                          The_priority => The_priority);
  end Get_from_end;

  Procedure Examine_beginning (Out_data     :    out Element;
                               The_priority : in     Priority) is
  begin 
    Buffer.Examine_beginning  (Out_data     => Out_data,
                               The_priority => The_priority);
  end Examine_beginning;

  Procedure Examine_end (Out_data     :    out Element;
                         The_priority : in     Priority) is
  begin 
    Buffer.Examine_end  (Out_data     => Out_data,
                         The_priority => The_priority);
  end Examine_end;

  Procedure Set_buffer_size (Buffer_size  : in POSITIVE) is
  begin 
    Buffer.Set_buffer_size  (New_buffer_size => Buffer_size);
  end Set_buffer_size;

  Function Quick_buffer_status return Status_value is
    Current_count : NATURAL;
    Max_count     : NATURAL;
  begin 
    Buffer.Get_buffer_count_total (Out_count => Current_count,
                                   Max_count => Max_count);
    if Current_count = Max_count then
      return full;
    elsif Current_count = 0 then
      return empty;
    else
      return partially_full;
    end if;
  end Quick_buffer_status;

  Procedure Buffer_status (Out_Count  : out NATURAL;
                           Out_status : out Status_value) is
    Current_count : NATURAL;
    Max_count     : NATURAL;
  begin 
    Buffer.Get_buffer_count_total (Out_count => Current_count,
                                   Max_count => Max_count);
    Out_count := Current_count;
    if Current_count = Max_count then
      Out_status := full;
    elsif Current_count = 0 then
      Out_status := empty;
    else
      Out_status := partially_full;
    end if;
  end Buffer_status;

  Procedure Quick_buffer_status (The_priority    : in     Priority;
                                 Priority_status :    out Status_value;
                                 Overall_status  :    out Status_value) is
    Current_count : NATURAL;
    Whole_count   : NATURAL;
    Max_count     : NATURAL;
    Total_status  : Status_value;
  begin 
    Buffer.Get_buffer_count (Out_count    => Current_count,
                             Total_count  => Whole_count,
                             Max_count    => Max_count,
                             The_priority => The_priority);
    if Whole_count = Max_count then
      Total_status := full;
    elsif Whole_count = 0 then
      Total_status := empty;
    else
      Total_status := partially_full;
    end if;
    if Total_status = full then
      Priority_status := full;
    elsif Current_count = 0 then
      Priority_status := empty;
    else
      Priority_status := partially_full;
    end if;
    Overall_status := Total_status;
  end Quick_buffer_status;

  Procedure Buffer_status (The_priority   : in     Priority;
                           Out_Count      :    out NATURAL;
                           Out_status     :    out Status_value;
                           Overall_count  :    out NATURAL;
                           Overall_status :    out Status_value) is
    Current_count : NATURAL;
    Whole_count   : NATURAL;
    Max_count     : NATURAL;
    Total_status  : Status_value;
  begin 
    Buffer.Get_buffer_count (Out_count    => Current_count,
                             Total_count  => Whole_count,
                             Max_count    => Max_count,
                             The_priority => The_priority);
    Out_count := Current_count;
    Overall_count := Whole_count;
    if Whole_count = Max_count then
      Total_status := full;
    elsif Whole_count = 0 then
      Total_status := empty;
    else
      Total_status := partially_full;
    end if;
    if Total_status = full then
      Out_status := full;
    elsif Current_count = 0 then
      Out_status := empty;
    else
      Out_status := partially_full;
    end if;
    Overall_status := Total_status;
  end Buffer_status;

  Procedure Put_at_buffer_beginning (The_element : in Element;
                                     The_buffer  : in Priority) is
    Previous_node,
    New_node        : Buffer_list.List_Node;
    New_element_ptr : Element_access;
    The_priority    : Priority;
  begin 
    New_element_ptr := new Element;
    New_element_ptr.ALL := The_element;
      for Priority_count in The_buffer..Priority''LAST loop
        The_priority := Priority_count;
        exit when Buffer_beginning (Priority_count) /= Empty_pointer;
      end loop;
      if Buffer_beginning (The_priority) = Empty_pointer then
        Buffer_list.Append_Node (To_list   => The_total_buffer,
                                 New_Value => New_element_ptr,
                                 New_Node  => New_node);
      else
        Previous_node := Buffer_list.Travel_Node (From_Node =>
                                           Buffer_beginning (The_priority),
                                                  Do_Forward => FALSE);
        Buffer_list.Insert_Node (To_Node   => Previous_node,
                                 New_Value => New_element_ptr,
                                 New_Node  => New_node);
      end if;
      if count (The_buffer) = 0 then
        Buffer_end (The_buffer) := New_node;
      end if;
    Buffer_beginning (The_buffer) := New_node;
    Count (The_buffer) := Count (The_buffer) + 1;
    Overall_count := Overall_count + 1;
  end Put_at_buffer_beginning;

  Procedure Put_at_buffer_end (The_element : in Element;
                               The_buffer  : in Priority) is
    New_node        : Buffer_list.List_Node;
    New_element_ptr : Element_access;
    The_priority    : Priority;
  begin 
    New_element_ptr := new Element;
    New_element_ptr.ALL := The_element;
    for Priority_count in reverse Priority''FIRST..The_buffer loop
      The_priority := Priority_count;
      exit when Buffer_beginning (Priority_count) /= Empty_pointer;
    end loop;
    if Buffer_end (The_priority) = Empty_pointer then
      Buffer_list.Insert_Node (To_Node   => The_total_buffer,
                               New_Value => New_element_ptr,
                               New_Node  => New_node);
    else
      Buffer_list.Insert_Node (To_Node   => Buffer_end (The_priority),
                               New_Value => New_element_ptr,
                               New_Node  => New_node);
    end if;
    if count (The_buffer) = 0 then
      Buffer_beginning (The_buffer) := New_node;
    end if;
    Buffer_end (The_buffer) := New_node;
    Count (The_buffer) := Count (The_buffer) + 1;
    Overall_count := Overall_count + 1;
  end Put_at_buffer_end;

  Procedure Copy_from_buffer_beginning (The_element :    out Element;
                                        The_buffer  : in     Priority) is
    The_element_ptr : Element_access;
  begin 
    The_element_ptr := Buffer_list.Value (Buffer_beginning (The_buffer));
    The_element := The_element_ptr.ALL;
  end Copy_from_buffer_beginning;

  Procedure Copy_from_buffer_end (The_element :    out Element;
                                  The_buffer  : in     Priority) is
    The_element_ptr : Element_access;
  begin 
    The_element_ptr := Buffer_list.Value (Buffer_end (The_buffer));
    The_element := The_element_ptr.ALL;
  end Copy_from_buffer_end;

  Procedure Get_from_buffer_beginning (The_element :    out Element;
                                       The_buffer  : in     Priority) is
    The_element_ptr : Element_access;
    Next_node       : Buffer_list.List_Node;
  begin 
    The_element_ptr := Buffer_list.Value (Buffer_beginning (The_buffer));
    The_element := The_element_ptr.ALL;
    Dispose_element (The_element_ptr);
    Next_node := Buffer_list.Travel_Node (From_Node  =>
                                             Buffer_beginning (The_buffer),
                                          Do_Forward => TRUE);
    Buffer_list.Delete_Node (The_Node => Buffer_beginning (The_buffer));
    Count (The_buffer) := Count (The_buffer) - 1;
    Overall_count := Overall_count - 1;
    if Count (The_buffer) <= 0 or Next_node = The_total_buffer then
      Buffer_beginning (The_buffer) := Empty_pointer;
      Buffer_end (The_buffer)       := Empty_pointer;
      Count (The_buffer) := 0;
    else
      Buffer_beginning (The_buffer) := Next_node;
    end if;
  end Get_from_buffer_beginning;

  Procedure Get_from_buffer_end (The_element :    out Element;
                                 The_buffer  : in     Priority) is
    The_element_ptr : Element_access;
    Next_node       : Buffer_list.List_Node;
  begin 
    The_element_ptr := Buffer_list.Value (Buffer_end (The_buffer));
    The_element := The_element_ptr.ALL;
    Dispose_element (The_element_ptr);
    Next_node := Buffer_list.Travel_Node (From_Node  =>
                                             Buffer_end (The_buffer),
                                          Do_Forward => FALSE);
    Buffer_list.Delete_Node (The_Node => Buffer_end (The_buffer));
    Count (The_buffer) := Count (The_buffer) - 1;
    Overall_count := Overall_count - 1;
    if Count (The_buffer) <= 0 or Next_node = The_total_buffer then
      Buffer_beginning (The_buffer) := Empty_pointer;
      Buffer_end (The_buffer)       := Empty_pointer;
      Count (The_buffer) := 0;
    else
      Buffer_end (The_buffer) := Next_node;
    end if;
  end Get_from_buffer_end;


begin 
  null;
end Intertask_buffer;'
]

{ #category : #'addit. webexamples' }
AdaTestSample class >> dblbuf [
	"from http://www.adapower.com/index.php?Command=Class&ClassID=AdaGraphics&Title=Graphics+Examples"
	"without 'aliased' and procedure_specifications"
	
	^'with Win32.Gl;

with Win32.Glu;

with Win32.Glaux;

with Interfaces.C;

with Interfaces.C.Strings;



procedure dblbuf is



   use Win32.Gl;

   use Win32.Glu;

   use Win32.Glaux;

   use Interfaces;

   use Interfaces.C;


   Res : GLenum;

   pragma Convention (Stdcall, Reshape);

   pragma Convention (Stdcall, Display);

   pragma Convention (Stdcall, Drag);

   pragma Convention (Stdcall, DragBegin);

   pragma Convention (Stdcall, DragEnd);



   wx, wy : GLsizei;

   mx, my : Interfaces.C.int;



   rx, ry, rz : GLdouble := 0.0;



   dragging : boolean := false;



   TetCallList : constant GLuint := 5;



   type iiar is array (GLushort range <>) of GLint;

   type iuar is array (GLushort range <>) of GLuint;





   procedure PrepareCallLists is



      z : constant GLdouble := 0.0;

      a : constant GLdouble := 0.4330127; -- 1/4 * sqrt(3)

      c : constant GLdouble := -0.75;



      subtype index3 is GLushort range 1 .. 3;

      type vertextype is array (index3) of GLdouble;

      type triangletype is array (index3) of GLushort;



      subtype index4 is GLushort range 1 .. 4;

      type v4type is array (index4) of vertextype;

      type t4type is array (index4) of triangletype;



      V : constant v4type :=

        ((-a, c, -a), (2.0*a, z, -a), (-a, -c, -a), (z, z, 2.0*a));



      T : constant t4type := ((4, 3, 1), (4, 2, 3), (4, 1, 2), (1, 3, 2));

   begin



      glNewList (TetCallList, GL_COMPILE);


      for i in index4 loop



         glBegin (GL_TRIANGLES);

         glVertex3dv (V (T (i)(1))(1)''Unrestricted_Access);

         glVertex3dv (V (T (i)(2))(1)''Unrestricted_Access);

         glVertex3dv (V (T (i)(3))(1)''Unrestricted_Access);

         glEnd;



         glBegin (GL_POLYGON);

         glNormal3dv (V (T (i)(1))(1)''Unrestricted_Access);

         glVertex3dv (V (T (i)(1))(1)''Unrestricted_Access);



         glNormal3dv (V (T (i)(2))(1)''Unrestricted_Access);

         glVertex3dv (V (T (i)(2))(1)''Unrestricted_Access);



         glNormal3dv (V (T (i)(3))(1)''Unrestricted_Access);

         glVertex3dv (V (T (i)(3))(1)''Unrestricted_Access);

         glEnd;



      end loop;



      glEndList;



   end PrepareCallLists;


   procedure Init is

      Mat_Shininess  : constant iiar (1 .. 1) := (1 => 50);

      Mat_Specular   : constant iiar (1 .. 4) := (1, 1, 1, 1);

      Light_Position : constant iuar (1 .. 4) := (0, 0, 10, 0);

   begin



      glMaterialiv (GL_FRONT, GL_SPECULAR,

                    Mat_Specular (1)''Unrestricted_Access);

      glMaterialiv (GL_FRONT, GL_SHININESS,

                    Mat_Shininess (1)''Unrestricted_Access);

      glLightiv (GL_LIGHT0, GL_POSITION,

                 Light_Position (1)''Unrestricted_Access);



      glEnable (GL_LIGHTING);

      glEnable (GL_LIGHT0);

      glDepthFunc (GL_LEQUAL);

      glEnable (GL_DEPTH_TEST);



      PrepareCallLists;



   end Init;




   procedure Reshape (W, H : in GLsizei) is

   begin



      glViewport (0, 0, W, H);

      glMatrixMode (GL_PROJECTION);

      glLoadIdentity;



      if W <= H then

         glOrtho (-1.5, 1.5, -1.5 * GLdouble (H) / GLdouble (W),

                  1.5 * GLdouble (H) / GLdouble (W), -10.0, 10.0);

      else

         glOrtho (-1.5*GLdouble (W) / GLdouble (H),

                  1.5*GLdouble (W) / GLdouble (H), -1.5, 1.5, -10.0, 10.0);

      end if;



      glMatrixMode (GL_MODELVIEW);



      wx := W;

      wy := H;



   end Reshape;



   procedure Display is

   begin



      glClear (GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);



      glLoadIdentity;



      if  abs rx > 1.0  then

         glRotated (rx, 1.0, 0.0, 0.0);

      end if;



      if  abs ry > 1.0  then

         glRotated (ry, 0.0, 1.0, 0.0);

      end if;



      if  abs rz > 1.0  then

         glRotated (rz, 0.0, 0.0, 1.0);

      end if;



      glCallList (TetCallList);



      glFlush;



      auxSwapBuffers;



   end Display;





   procedure DragBegin (Event : access AUX_EVENTREC)  is

   begin

      mx := Event.data (AUX_MOUSEX);

      my := Event.data (AUX_MOUSEY);

      dragging := True;

   end DragBegin;



   procedure DragEnd (Event : AUX_EVENTREC)  is

   begin

      dragging := False;

   end DragEnd;



   procedure Drag (Event : AUX_EVENTREC)  is

      tx, ty : Win32.INT;

   begin



      if dragging then

         tx := Event.data (AUX_MOUSEX);

         ty := Event.data (AUX_MOUSEY);

         if abs (tx - mx) + abs (ty - my) > 1 then

            rx := rx + 120.0 * GLdouble (ty - my) / GLdouble (wy);

            ry := ry + 120.0 * GLdouble (tx - mx) / GLdouble (wx);

            mx := tx;

            my := ty;

         end if;



         Display;

      end if;



   end Drag;





begin

   auxInitDisplayMode (AUX_DOUBLE + AUX_RGB + AUX_DEPTH);

   auxInitPosition (0, 0, 500, 500);

   Res := auxInitWindow (Window_Name (Window_Name''First)''Unchecked_Access);

   Init;

   auxReshapeFunc (Reshape''Unrestricted_Access);

   auxMouseFunc (AUX_LEFTBUTTON, AUX_MOUSEDOWN, DragBegin''Unrestricted_Access);

   auxMouseFunc (AUX_LEFTBUTTON, AUX_MOUSEUP,  DragEnd''Unrestricted_Access);

   auxMouseFunc (AUX_LEFTBUTTON, AUX_MOUSELOC, Drag''Unrestricted_Access);

   auxMainLoop (Display''Unrestricted_Access);

end dblbuf;'
]

{ #category : #'addit. webexamples' }
AdaTestSample class >> dblbuf2 [
	"from http://www.adapower.com/index.php?Command=Class&ClassID=AdaGraphics&Title=Graphics+Examples"
	"without 'aliased' and procedure_specifications"
	
	^'with Win32.Gl;

with Win32.Glu;

with Win32.Glaux;

with Interfaces.C;

with Interfaces.C.Strings;



procedure dblbuf is



   use Win32.Gl;

   use Win32.Glu;

   use Win32.Glaux;

   use Interfaces;

   use Interfaces.C;


   Res : GLenum;

   pragma Convention (Stdcall, Reshape);

   pragma Convention (Stdcall, Display);

   pragma Convention (Stdcall, Drag);

   pragma Convention (Stdcall, DragBegin);

   pragma Convention (Stdcall, DragEnd);



   wx, wy : GLsizei;

   mx, my : Interfaces.C.int;



   rx, ry, rz : GLdouble := 0.0;



   dragging : boolean := false;



   TetCallList : constant GLuint := 5;


   procedure PrepareCallLists is


      z : constant GLdouble := 0.0;

      a : constant GLdouble := 0.4330127; -- 1/4 * sqrt(3)

      c : constant GLdouble := -0.75;



      subtype index3 is GLushort range 1 .. 3;

      type vertextype is array (index3) of GLdouble;

      type triangletype is array (index3) of GLushort;



      subtype index4 is GLushort range 1 .. 4;

      type v4type is array (index4) of vertextype;

      type t4type is array (index4) of triangletype;



      V : constant v4type :=

        ((-a, c, -a), (2.0*a, z, -a), (-a, -c, -a), (z, z, 2.0*a));



      T : constant t4type := ((4, 3, 1), (4, 2, 3), (4, 1, 2), (1, 3, 2));

   begin



      glNewList (TetCallList, GL_COMPILE);


      for i in index4 loop



         glBegin (GL_TRIANGLES);

         glVertex3dv (V (T (i)(1))(1)''Unrestricted_Access);

         glVertex3dv (V (T (i)(2))(1)''Unrestricted_Access);

         glVertex3dv (V (T (i)(3))(1)''Unrestricted_Access);

         glEnd;



         glBegin (GL_POLYGON);

         glNormal3dv (V (T (i)(1))(1)''Unrestricted_Access);

         glVertex3dv (V (T (i)(1))(1)''Unrestricted_Access);



         glNormal3dv (V (T (i)(2))(1)''Unrestricted_Access);

         glVertex3dv (V (T (i)(2))(1)''Unrestricted_Access);



         glNormal3dv (V (T (i)(3))(1)''Unrestricted_Access);

         glVertex3dv (V (T (i)(3))(1)''Unrestricted_Access);

         glEnd;



      end loop;



      glEndList;



   end PrepareCallLists;


   procedure Init is

      Mat_Shininess  : constant iiar (1 .. 1) := (1 => 50);

      Mat_Specular   : constant iiar (1 .. 4) := (1, 1, 1, 1);

      Light_Position : constant iuar (1 .. 4) := (0, 0, 10, 0);

   begin



      glMaterialiv (GL_FRONT, GL_SPECULAR,

                    Mat_Specular (1)''Unrestricted_Access);

      glMaterialiv (GL_FRONT, GL_SHININESS,

                    Mat_Shininess (1)''Unrestricted_Access);

      glLightiv (GL_LIGHT0, GL_POSITION,

                 Light_Position (1)''Unrestricted_Access);



      glEnable (GL_LIGHTING);

      glEnable (GL_LIGHT0);

      glDepthFunc (GL_LEQUAL);

      glEnable (GL_DEPTH_TEST);



      PrepareCallLists;



   end Init;




   procedure Reshape (W, H : in GLsizei) is

   begin



      glViewport (0, 0, W, H);

      glMatrixMode (GL_PROJECTION);

      glLoadIdentity;



      if W <= H then

         glOrtho (-1.5, 1.5, -1.5 * GLdouble (H) / GLdouble (W),

                  1.5 * GLdouble (H) / GLdouble (W), -10.0, 10.0);

      else

         glOrtho (-1.5*GLdouble (W) / GLdouble (H),

                  1.5*GLdouble (W) / GLdouble (H), -1.5, 1.5, -10.0, 10.0);

      end if;



      glMatrixMode (GL_MODELVIEW);



      wx := W;

      wy := H;



   end Reshape;



   procedure Display is

   begin



      glClear (GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);



      glLoadIdentity;



      if  abs rx > 1.0  then

         glRotated (rx, 1.0, 0.0, 0.0);

      end if;



      if  abs ry > 1.0  then

         glRotated (ry, 0.0, 1.0, 0.0);

      end if;



      if  abs rz > 1.0  then

         glRotated (rz, 0.0, 0.0, 1.0);

      end if;



      glCallList (TetCallList);



      glFlush;



      auxSwapBuffers;



   end Display;





   procedure DragBegin (Event : access AUX_EVENTREC)  is

   begin

      mx := Event.data (AUX_MOUSEX);

      my := Event.data (AUX_MOUSEY);

      dragging := True;

   end DragBegin;



   procedure DragEnd (Event : AUX_EVENTREC)  is

   begin

      dragging := False;

   end DragEnd;



   procedure Drag (Event : AUX_EVENTREC)  is

      tx, ty : Win32.INT;

   begin



      if dragging then

         tx := Event.data (AUX_MOUSEX);

         ty := Event.data (AUX_MOUSEY);

         if abs (tx - mx) + abs (ty - my) > 1 then

            rx := rx + 120.0 * GLdouble (ty - my) / GLdouble (wy);

            ry := ry + 120.0 * GLdouble (tx - mx) / GLdouble (wx);

            mx := tx;

            my := ty;

         end if;



         Display;

      end if;



   end Drag;





begin

   auxInitDisplayMode (AUX_DOUBLE + AUX_RGB + AUX_DEPTH);

   auxInitPosition (0, 0, 500, 500);

   Res := auxInitWindow (Window_Name (Window_Name''First)''Unchecked_Access);

   Init;

   auxReshapeFunc (Reshape''Unrestricted_Access);

   auxMouseFunc (AUX_LEFTBUTTON, AUX_MOUSEDOWN, DragBegin''Unrestricted_Access);

   auxMouseFunc (AUX_LEFTBUTTON, AUX_MOUSEUP,  DragEnd''Unrestricted_Access);

   auxMouseFunc (AUX_LEFTBUTTON, AUX_MOUSELOC, Drag''Unrestricted_Access);

   auxMainLoop (Display''Unrestricted_Access);

end dblbuf;'
]

{ #category : #'addit. gps' }
AdaTestSample class >> instructions [
	
	^'with Except;
with Screen_Output;
with Stack;
with Values;

package body Instructions is

   function Read (Word : String) return Instruction is
   begin

      for I in Instruction loop

         if InstructionImage (I) = Word then
            return I;
         end if;
      end loop;

      raise Except.User_Error;
   end Read;

   procedure Process (I : Instruction) is
   begin
      case I is
         when Clear =>
            Stack.Clear;

         when Print =>
            Screen_Output.Msg (" -> ", End_Line => False);

            if Stack.Empty then
               Screen_Output.Msg ("stack is empty");
            else
               Screen_Output.Msg (Values.To_String (Stack.Top));
            end if;

         when Quit =>
            raise Except.Exit_SDC;

      end case;
   end Process;

end Instructions;'
]

{ #category : #'addit. arts' }
AdaTestSample class >> linklistAdb [
	
	^'  with Unchecked_Deallocation ;

  package body Linked_List is

    type List_Item is record
                        Data       : Item_To_Manage := Illegal_Value ;
                        Prior_Item : List_Node      := Empty_Node    ;
                        Next_Item  : List_Node      := Empty_Node    ;
                      end record ;
    

    Function Allocate_New_Node( Data      : in     Item_To_Manage ;
                                Prior     : in     List_Node      ;
                                Next      : in     List_Node      ) 
                                                           return List_Node is
      Node : List_Node := New List_Item ;
    begin 
      Node.all := ( Data , Prior , Next ) ;
      return Node ;
    end Allocate_New_Node ;
    
    Procedure Initialize_List ( New_List    : in out List_Node    ) is
    begin 
      Terminate_List ( New_List ) ;
      New_List := Allocate_New_Node ( Illegal_Value, Empty_Node, Empty_Node ) ;
      New_List.Prior_Item := New_List ;
      New_List.Next_Item  := New_List ;
    end Initialize_List ;

    Procedure Terminate_List  ( Root_Node   : in out List_Node    ) is
      Next_Node : List_Node ;
    begin 
      Loop
        If Root_Node = Empty_Node then
          return ;
        else
          Next_Node := Root_Node.Next_Item ;
          If Next_Node = Root_Node then
            return ;
          else
            Delete_Node ( Root_Node ) ;
            Root_Node := Next_Node ;
          end if ;
        end if ;
      end loop ;
    end Terminate_List ;
    
    Procedure Rotate_To_Root  ( Work_Node : in out List_Node      ) is
    begin 
      if Work_Node = Empty_Node then
        raise List_Exception ;
      else
        Loop
        exit when Work_Node.Data = Illegal_Value ;
          Work_Node := Work_Node.Next_Item ;
        end Loop ;
      end if ;
    end Rotate_To_Root ;
    
    Procedure Append_Node     ( To_List   : in     List_Node      ;
                                New_Value : in     Item_To_Manage ;
                                New_Node  :    out List_Node      ) is
      Work_Node : List_Node := To_List ;
    begin 
      if Work_Node = Empty_Node then
        raise List_Exception ;
      else
        Rotate_To_Root ( Work_Node ) ;
        Insert_Node ( Work_Node.Prior_Item , New_Value , New_Node ) ;
      end if ;
    end Append_Node ;
    
    Procedure Insert_Node     ( To_Node   : in     List_Node      ;
                                New_Value : in     Item_To_Manage ;
                                New_Node  :    out List_Node      ) is
      A_Node : List_Node ;
    begin 
      if To_Node = Empty_Node then
        raise List_Exception ;
      else
        A_Node := Allocate_New_Node ( Data  => New_Value          ,
                                      Prior => To_Node            ,
                                      Next  => To_Node.Next_Item  ) ;
        A_Node.Next_Item.Prior_Item := A_Node ;
        A_Node.Prior_Item.Next_Item := A_Node ;
        New_Node := A_Node ;
      end if ;
    end Insert_Node ;
    
    Procedure Merge_List      ( To_List   : in     List_Node      ;
                                To_Node   : in     List_Node      ;
                                Old_List  : in out List_Node      ) is
      First_Node_Old_List : List_Node ;
      Last_Node_Old_List  : List_Node ;
      After_Node          : List_Node := To_Node ;
      Before_Node         : List_Node ;
    begin 
      if ( To_Node = Empty_Node ) or ( To_List = Empty_Node ) 
                                  or ( Old_List = Empty_Node ) then
        raise List_Exception ;
      else
        First_Node_Old_List := Find_First_Node ( Old_List ) ;
        Last_Node_Old_List := Find_Last_Node ( Old_List ) ;
        Before_Node := To_Node.Next_Item ;
        if ( Find_First_Node(To_List) = First_Node_Old_List ) then
          raise List_Exception ;
        else
          First_Node_Old_List.Prior_Item := After_Node ;
          After_Node.Next_Item := First_Node_Old_List ;
          Last_Node_Old_list.Next_Item := Before_Node ;
          Before_Node.Prior_Item := Last_Node_Old_List ;
          Old_List.Next_Item := Old_List ;
          Old_List. Prior_Item := Old_List ;
        end if ;
      end if ;
    end merge_list ;

    Procedure Delete_Node     ( The_Node  : in out List_Node      ) is
    begin 
      if The_Node = Empty_Node then
        raise List_Exception ;
      else
        The_Node.Prior_Item.Next_Item := The_Node.Next_Item ;
        The_Node.Next_Item.Prior_Item := The_Node.Prior_Item ;
        The_Node := Empty_Node ;
      end if ;
    end Delete_Node ;

    Procedure Prune_Node      ( The_Node  : in     List_Node      ;
                                New_List  : in out List_Node      ) is
    begin 
      null ; 
    end Prune_Node ;
    
    Procedure Delete_Value ( From_List   : in     List_Node        ;
                             Old_Value   : in     Item_To_Manage   ) is
    begin 
      null ; 
    end Delete_Value ;
    
    Procedure Update_Node ( The_Node  : in List_Node       ;
                            New_Value : in Item_To_Manage  ) is
    begin
      if The_Node = Empty_Node then
        raise List_Exception ;
      else
        The_Node.Data := New_Value ;
      end if ;
    end Update_Node ;
    
    Function Travel_Node ( From_Node     : in List_Node          ;
                           Do_Forward    : in Boolean := True    )
                                         return List_Node is
    begin 
      if From_Node = Empty_Node then
        raise List_Exception ;
      elsif Do_Forward then
        return From_Node.Next_Item ;
      else
        return From_Node.Prior_Item ;
      end if ;
    end Travel_Node ;
    
    Function Find_Node ( Inside_List     : in List_Node      ; 
                         Old_Value       : in Item_To_Manage ) 
                                               return List_Node is
      Work_Node : List_Node := Inside_List ;
      Stop_Node : List_Node := Inside_List ;
    begin 
      if Work_Node = Empty_Node then
        return Empty_Node ;
      else
        Loop
          if Work_Node.Data = Old_Value then
            return Work_Node ;
          else
            Work_Node := Work_Node.Next_Item ;
            If Work_Node = Stop_Node then
              return Empty_Node ;
            end if ;
          end if ;
        end Loop ;
      end if ;
    end Find_Node ;
    
    Procedure Where_To_Add_New_Node ( To_Node    : out List_Node     ) is
    begin 
      To_Node := Empty_Node;
    end Where_To_Add_New_Node ;
    
    Function Find_First_Node ( Inside_List     : in List_Node      ) 
                                                            return List_Node is
      Work_Node : List_Node := Inside_List ;
    begin 
      Rotate_To_Root ( Work_Node ) ;
      return Work_Node.Next_Item ;
    end Find_First_Node ;
    
    Function Find_Last_Node  ( Inside_List     : in List_Node      ) 
                                                            return List_Node is
      Work_Node : List_Node := Inside_List ;
    begin 
      Rotate_To_Root ( Work_Node ) ;
      return Work_Node.Prior_Item ;
    end Find_Last_Node ;
    
    Function Find_Next_Node  ( Current_Node    : in List_Node          ;
                               Do_Forward      : in Boolean := True    )
                                               return List_Node is
    begin 
      If Current_Node = Empty_Node then
        raise List_Exception ;
      elsif Do_Forward then
        return Current_Node.Next_Item ;
      else
        return Current_Node.Prior_Item ; 
      end if ;
    end Find_Next_Node ;
    
    Function Value ( From_Node : in List_Node ) return Item_To_Manage is
    begin 
      If From_Node = Empty_Node then
        raise List_Exception ;
      else
        return From_Node.Data ;
      end if ;
    end Value ;
    
    
    Procedure Swap_Nodes ( First_Node  : in out List_Node ;
                           Second_Node : in out List_Node ) is
      Temp_Item_1 : Item_To_Manage ;
      Temp_Item_2 : Item_To_Manage ;
    begin 
      if First_Node = Empty_Node or Second_Node = Empty_Node then
        raise List_Exception ;
      else
        Temp_Item_1 := Value( First_Node ) ;
        Temp_Item_2 := Value( Second_Node ) ;
        First_Node.Data  := Temp_Item_2 ;
        Second_Node.Data := Temp_Item_1 ;
      end if ;
      end Swap_Nodes ;
    
    
  end Linked_List ;  
  

'
]

{ #category : #'addit. arts' }
AdaTestSample class >> linklistAds [
	
	^'
  generic
    type ITEM_TO_MANAGE is private ;
    Illegal_Value : Item_To_Manage ;
  package Linked_List is  
    
    type List_Node is Private ;        
    
    Empty_Node : Constant List_Node ;  
    
    List_Exception : exception ;       
    
    Empty_List_After_Deletion : exception ;  
    
    Procedure Initialize_List ( New_List    : in out List_Node    ) ;
    
    Procedure Terminate_List  ( Root_Node   : in out List_Node    ) ;
      
    Procedure Append_Node     ( To_List   : in     List_Node      ;
                                New_Value : in     Item_To_Manage ;
                                New_Node  :    out List_Node      ) ;
    
    Procedure Insert_Node     ( To_Node   : in     List_Node      ;
                                New_Value : in     Item_To_Manage ;
                                New_Node  :    out List_Node      ) ;
    
    Procedure Merge_List      ( To_List   : in     List_Node      ;
                                To_Node   : in     List_Node      ;
                                Old_List  : in out List_Node      ) ;
    
    Procedure Delete_Node     ( The_Node  : in out List_Node      ) ;
    
    Procedure Prune_Node      ( The_Node  : in     List_Node      ;
                                New_List  : in out List_Node      ) ;
    
    Procedure Delete_Value ( From_List   : in     List_Node        ;
                             Old_Value   : in     Item_To_Manage   ) ;
      
    Procedure Update_Node ( The_Node  : in List_Node      ;
                            New_Value : in Item_To_Manage ) ;
    
    Function Travel_Node ( From_Node     : in List_Node          ;
                           Do_Forward    : in Boolean := True    )
                                         return List_Node ;
    
    Function Find_Node ( Inside_List     : in List_Node      ; 
                         Old_Value       : in Item_To_Manage ) 
                                               return List_Node ;
    
    Procedure Where_To_Add_New_Node ( To_Node    : out List_Node     ) ;
    
    Function Find_First_Node ( Inside_List     : in List_Node      ) 
                                                            return List_Node ;
    
    Function Find_Last_Node  ( Inside_List     : in List_Node      ) 
                                                            return List_Node ;
    
    Function Find_Next_Node  ( Current_Node    : in List_Node          ;
                               Do_Forward      : in Boolean := True    )
                                               return List_Node ;
    
    Function Value ( From_Node : in List_Node ) return Item_To_Manage ;
    
    Procedure Swap_Nodes ( First_Node  : in out List_Node ;
                           Second_Node : in out List_Node ) ;
                     
  private
    
    type List_Item ;
    
    type List_Node is access List_Item ;
    
    Empty_Node : Constant List_Node := null ;  
    
    
  end Linked_List ;  
  
'
]

{ #category : #'addit. arts' }
AdaTestSample class >> lockmgrAdb [
	
	^'with Linked_list; 
with Unordered_Tree;
with UNCHECKED_CONVERSION;
 
Package body Lock_manager is
 
  type Lock_node is record
                      Number_of_locks      : NATURAL := 0;
                      Type_of_lock         : Lock_status;
                      Block_non_exclusive  : NATURAL := 0;
                    end record;
 
  Invalid_Node : constant Lock_Node := (Number_of_Locks => 0,
                                        Type_of_lock    =>
                                                        Locked_non_exclusive,
                                        Block_non_exclusive => 0);
                                        
  Invalid_id  : constant Lock_id := new Lock_node''(Invalid_node);
  
  Package Locked_id_list is new Linked_list (Item_to_manage => Lock_id,
                                             Illegal_value  => Invalid_id);
  use Locked_id_list;      

  type Unavailable_node is new Locked_id_list.List_node;
 
  Task Lock_task is
    entry New_lock_tree       (The_tree         :     out Lock_id);
    entry Add_sub_lock        (To_lock          : in      Lock_id;
                               New_lock         :     out Lock_id);
    entry Dispose_lock_tree   (The_tree         : in      Lock_id);
    entry Request_lock        (The_lock         : in     Lock_id;
                               Request_type     : in     Access_type;
                               Request_granted  :    out BOOLEAN);
    entry Nowait_request_lock  (The_lock        : in     Lock_id;
                                Request_type    : in     Access_type;
                                Locked_list_ptr :    out Unavailable_access;
                                Lock_acquired   :    out BOOLEAN);
    entry Release_lock        (The_lock         : in     Lock_id);
    entry Block_non_exclusive (The_lock         : in     Lock_id);
    entry Unblock_non_exclusive (The_lock       : in     Lock_id);
    entry Status_lock         (The_lock         : in     Lock_id;
                               Return_status    :    out Lock_status);
  end Lock_task;
 
  Function New_lock_tree return Lock_id is
    New_node : Lock_id;
  begin 
    Lock_task.New_lock_tree (The_tree => New_node);
    return New_node;
  end New_lock_tree;
 
  Function  Add_sub_lock (To_lock : in Lock_id) return Lock_id is
    New_node : Lock_id;
  begin 
    Lock_task.Add_sub_lock (To_lock  => To_lock,
                            New_lock => New_node);
    return New_node;
  end Add_sub_lock;
 
  Procedure Dispose_lock_tree (The_lock : in Lock_id) is
  begin 
    Lock_task.Dispose_lock_tree (The_tree => The_lock);
  end Dispose_lock_tree;
 
  Function  Wait_request_lock (The_lock     : in Lock_id;
                               Request_type : in Access_type)
                                                       return BOOLEAN is
    Request_granted : BOOLEAN;
  begin 
    Lock_task.Request_lock (The_lock        => The_lock,
                            Request_type    => Request_type,
                            Request_granted => Request_granted);
    if not Request_granted then
      if Request_type = Exclusive then
        Lock_task.Block_non_exclusive (The_lock => The_lock);
      end if;
      loop
        Lock_task.Request_lock (The_lock        => The_lock,
                                Request_type    => Request_type,
                                Request_granted => Request_granted);
        exit when Request_granted;
      end loop;
      if Request_type = Exclusive then
        Lock_task.Unblock_non_exclusive (The_lock => The_lock);
      end if;
    end if;
    return TRUE;
  end Wait_request_lock;
 
  Function  Nowait_request_lock (The_lock     : in Lock_id;
                                 Request_type : in Access_type)
                                                      return BOOLEAN is
    Request_granted : BOOLEAN;
  begin 
    Lock_task.Request_lock (The_lock        => The_lock,
                            Request_type    => Request_type,
                            Request_granted => Request_granted);
    return Request_granted;
  end Nowait_request_lock;

  Procedure Nowait_request_lock  (The_lock        : in     Lock_id;
                                  Request_type    : in     Access_type;
                                  Locked_list_ptr :    out Unavailable_access;
                                  Lock_acquired   :    out BOOLEAN) is
  Lock_flag : BOOLEAN;
  New_access: Unavailable_access;
  begin
    Lock_task.Nowait_request_lock  (The_lock        => The_lock,
                                    Request_type    => Request_type,
                                    Locked_list_ptr => New_access,
                                    Lock_acquired   => Lock_flag);
    Locked_list_ptr := New_access;
    Lock_acquired := Lock_flag;
  end Nowait_request_lock;

  Procedure Release_lock (The_lock : in Lock_id) is
  begin 
    Lock_task.Release_lock (The_lock => The_lock);
  end Release_lock;
 
  Function  Status_lock (The_lock : in Lock_id) return Lock_status is
    The_status : Lock_status;
  begin 
    Lock_task.Status_lock (The_lock      => The_lock,
                           Return_status => The_status);
    return The_status;
  end Status_lock;
 
  Procedure Find_first_element   (The_list_ptr   : in     Unavailable_access;
                                  First_node_ptr :    out Unavailable_access;
                                  First_lock_id  :    out Lock_id;
                                  Item_exists    :    out BOOLEAN) is

  Root_node, 
  Temp_node : Locked_id_list.List_node; 
  
  begin
    if The_list_ptr = null then
      raise Invalid_list_access;
    else
      Root_node := Locked_id_list.List_node (The_list_ptr.all);
      Temp_node := Locked_id_list.Travel_node (From_node => Root_node);
      if Temp_node /= Root_node then
        First_node_ptr := new Unavailable_node''(Unavailable_node (Temp_node));
        First_lock_id := Locked_id_list.Value (Temp_node);
        Item_exists := TRUE;
      else
        Item_exists := FALSE;        
      end if; 
    end if;
    
    exception
      when List_exception => raise Invalid_list_access;
  end Find_first_element;
  
  Procedure Find_next_element    (The_list_ptr  : in     Unavailable_access;
                                  This_node_ptr : in     Unavailable_access;
                                  Next_node_ptr :    out Unavailable_access;
                                  Next_lock_id  :    out Lock_id;
                                  Item_exists   :    out BOOLEAN) is

  Root_node,
  Start_node,
  Temp_node : Locked_id_list.List_node; 

  begin
    if The_list_ptr = null then
      raise Invalid_list_access;
    else
      Root_node := Locked_id_list.List_node (The_list_ptr.all);
      Start_node := Locked_id_list.List_node (This_node_ptr.all);
      Temp_node := Locked_id_list.Travel_node (From_node => 
                                               Locked_id_list.List_node 
                                                 (Start_node));
      if Temp_node /= Root_node then
        Next_node_ptr := new Unavailable_node''(Unavailable_node (Temp_node));
        Next_lock_id := Locked_id_list.Value (Temp_node);
        Item_exists := TRUE;
      else
        Item_exists := FALSE;        
      end if; 
    end if;
    
    exception
      when List_exception => raise Invalid_list_access;
  end Find_next_element;

  Procedure Dispose_lock_list    (The_list_ptr : in out Unavailable_access) is
  begin
    Locked_id_list.Terminate_list (Root_node => 
                                     Locked_id_list.List_node 
                                                      (The_list_ptr.all));
    The_list_ptr := null;
  end Dispose_lock_list;

 
  Task body Lock_task is
 
  type Lock_node_ptr is access Lock_node;
 
  Package Tree_manager is new Unordered_tree (ITEM_TO_MANAGE => Lock_node,
                                              Illegal_Value  =>
                                                            Invalid_Node);
                                                            
  use Tree_manager;
 
  Lock_tree_root    : Lock_id;
  New_node          : constant Lock_node := (Number_of_locks      => 0,
                                             Type_of_lock         => Unlocked,
                                             Block_non_exclusive => 0);
  The_Tree_Node,
  Temp_tree_node    : Tree_manager.Tree_Node;
  The_access        : Unavailable_access;
  The_status        : Lock_status;
  The_value         : Lock_node;
 
  Function Tree_Node_to_Lock_id is new UNCHECKED_CONVERSION (
                                                  SOURCE =>
                                                    Tree_manager.Tree_Node,
                                                  TARGET => Lock_id);
 
  Function Lock_id_to_Tree_Node is new UNCHECKED_CONVERSION (
                                                  SOURCE => Lock_id,
                                                  TARGET =>
                                                    Tree_manager.Tree_Node);
 
  Function Status_sub_tree (The_tree : in Lock_id) return Lock_status is
    Start_Depth       : NATURAL;
    The_value         : Lock_node;
    The_Tree_Node     : Tree_manager.Tree_Node;
    Return_status     : Lock_status;
  begin 
    The_Tree_Node := Lock_id_to_Tree_Node (The_tree);
    The_value     := Tree_manager.Value (From_Node => The_Tree_Node);
    return_status := Unlocked;
    if Tree_manager.Travel_node (From_node => The_Tree_Node,
                                 Direction => Tree_Manager.To_Child)
                                         /= Tree_Manager.Empty_Node then
      Start_depth := Tree_manager.Depth (This_Node => The_Tree_Node);
      STATUS_LOOP:
      loop                       
        case The_value.Type_of_lock is
          when Locked_exclusive =>
            Return_status := Locked_exclusive;
            exit STATUS_LOOP;       
          when Locked_non_exclusive =>
            Return_status := Locked_non_exclusive;
          when others =>
            null;
        end case;
        The_Tree_Node := Tree_manager.Next_Node (Which_Node =>
                                                     The_Tree_Node);
        if The_Tree_Node = Tree_manager.Empty_Node then
          exit STATUS_LOOP;
        elsif Tree_manager.Depth (This_Node => The_Tree_Node)
                                               <= Start_Depth then
          exit STATUS_LOOP;
        end if;
        The_value := Tree_manager.Value (From_Node => The_Tree_Node);
      end loop STATUS_LOOP;
      return Return_status;
    else    
      return The_value.Type_of_lock;
    end if;
 
  exception
    when Tree_manager.Tree_exception => raise Invalid_lock_id;
              
  end Status_sub_tree;
 
  Procedure Check_sub_tree (The_tree        : in     Lock_id;
                            Return_list_ptr :    out Unavailable_access;
                            Return_status   :    out Lock_status) is


    Start_Depth   : NATURAL;
    The_value     : Lock_node;
    Temp_tree_node,
    The_Tree_Node : Tree_manager.Tree_Node;
    Locked_list,
    Temp_node     : Locked_id_list.List_node;
    Tree_status   : Lock_status;

  Function Is_Locked (The_tree  : in Tree_manager.Tree_Node;
                      Type_lock : in Lock_status)    return BOOLEAN is

    The_value   : Lock_node;

  begin  
    The_value := Tree_manager.Value (From_Node => The_tree);
    return The_value.Type_of_lock = Type_lock;
  end Is_Locked;

  Procedure Add_Locked_Children (The_tree   : in Tree_manager.Tree_Node;
                                 The_list   : in out Locked_id_list.List_node;
                                 The_status : in out Lock_status) is


    Child_Node  : Tree_manager.Tree_Node;
    Temp_node   : Locked_id_list.List_node;
    Temp_status : Lock_status;

  begin  
    Child_Node := Tree_manager.Travel_node (From_node =>
                                                   The_tree,
                                            Direction =>
                                                   Tree_manager.To_Child);
    loop
      exit when Child_Node = Tree_Manager.Empty_Node;
      if Is_Locked (The_tree  => Child_Node,
                    Type_lock => Locked_exclusive) then
        Locked_id_list.Append_node (To_list   => The_list,
                                    New_value => Tree_Node_to_Lock_id
                                                   (Child_Node),
                                    New_node  => Temp_node);
        The_status := Locked_exclusive;
      else
        if Is_Locked (The_tree  => Child_Node,
                      Type_lock => Locked_non_exclusive) then
          Temp_status := Locked_non_exclusive;
        else
          Temp_status := Unlocked;
        end if;
        Add_Locked_Children (The_tree   => Child_Node,
                             The_list   => The_list,
                             The_status => Temp_status);
        if The_status /= Locked_exclusive then
          if Temp_status /= The_status then
            The_status := Temp_status;
          end if;
        end if;
      end if;
      Child_Node := Tree_manager.Travel_node (From_node =>
                                                        Child_Node,
                                              Direction =>
                                                        Tree_manager.
                                                              To_Sibling);
    end loop;
  end Add_Locked_Children;

  begin 
    Locked_id_list.Initialize_list (New_list => Locked_list);
    Tree_status := Unlocked;

    if Is_Locked (The_tree  => Lock_id_to_Tree_Node (The_tree),
                  Type_lock => Locked_exclusive) then
      Temp_tree_node := Lock_id_to_Tree_Node (The_tree);
      loop
        The_Tree_Node := Temp_tree_node;
        Temp_tree_node := Tree_manager.Travel_node (From_node =>
                                                          Temp_tree_node,
                                                    Direction =>
                                                          Tree_manager.
                                                                To_Parent);
        exit when Temp_tree_node = Tree_manager.Empty_Node;
        exit when not Is_Locked (Temp_tree_node, Locked_exclusive);
      end loop;

      Locked_id_list.Append_node (To_list   => Locked_list,
                                  New_value => Tree_Node_to_Lock_id
                                                     (The_Tree_Node),
                                  New_node  => Temp_node);
      Tree_status := Locked_exclusive;
    else  

      Add_Locked_Children (The_tree   => Lock_id_to_Tree_Node (The_tree),
                           The_list   => Locked_list,
                           The_status => Tree_status);

    end if;

    Return_list_ptr := new Unavailable_node''(Unavailable_node (Locked_list));
    Return_status := Tree_status;

  exception
    when Tree_manager.Tree_exception => raise Invalid_lock_id;

  end Check_sub_tree;

  Function Non_exclusive_accept (The_tree : in Lock_id) return BOOLEAN is
    Start_Depth       : NATURAL;
    The_value         : Lock_node;
    The_Tree_Node     : Tree_manager.Tree_Node;
    Return_status     : BOOLEAN;
  begin 
    The_Tree_Node := Lock_id_to_Tree_Node (The_tree);
    The_value     := Tree_manager.Value (From_Node => The_Tree_Node);
    Return_status := TRUE;
    if Tree_manager.Travel_node (From_node => The_Tree_Node,
                                 Direction => Tree_Manager.To_Child)
                                         /= Tree_Manager.Empty_Node then
      Start_depth := Tree_manager.Depth (This_Node => The_Tree_Node);
      STATUS_LOOP:
      loop                       
        if The_value.Block_non_exclusive > 0 then
          Return_status := FALSE;
          exit STATUS_LOOP;       
        end if;
        The_Tree_Node := Tree_manager.Next_Node (Which_Node =>
                                                     The_Tree_Node);
        if The_Tree_Node = Tree_manager.Empty_Node then
          exit STATUS_LOOP;
        elsif Tree_manager.Depth (This_Node => The_Tree_Node)
                                               <= Start_Depth then
          exit STATUS_LOOP;
        end if;
        The_value := Tree_manager.Value (From_Node => The_Tree_Node);
      end loop STATUS_LOOP;
      return Return_status;
    else    
      Return_status := The_value.Block_non_exclusive = 0;
    end if;
 
    return Return_status;
 
  exception
    when Tree_manager.Tree_exception => raise Invalid_lock_id;
              
  end Non_exclusive_accept;
 
  Procedure Modify_block_non_exclusive (The_tree : in Lock_id;
                                         Value    : in INTEGER) is
    Start_Depth       : NATURAL;
    The_value         : Lock_node;
    The_Tree_Node     : Tree_manager.Tree_Node;
  begin 
    The_Tree_Node := Lock_id_to_Tree_Node (The_tree);
    The_value     := Tree_manager.Value (From_Node => The_Tree_Node);
    Start_depth   := Tree_manager.Depth (This_Node => The_Tree_Node);
    UPDATE_LOOP:
    loop                       
      The_value.Block_non_exclusive := The_value.Block_non_exclusive +
                                              Value;
      Tree_manager.Update_Node (The_Tree_Node, The_value);
      The_Tree_Node := Tree_manager.Next_Node (Which_Node => The_Tree_Node);
      if The_Tree_Node = Tree_manager.Empty_Node then
        exit UPDATE_LOOP;
      elsif Tree_manager.Depth (This_Node => The_Tree_Node)
                                           <= Start_Depth then
        exit UPDATE_LOOP;
      end if;
      The_value := Tree_manager.Value (From_Node => The_Tree_Node);
    end loop UPDATE_LOOP;
 
  exception
    when Tree_manager.Tree_exception => raise Invalid_lock_id;
              
  end Modify_block_non_exclusive;

  Procedure Increment_block_non_exclusive (The_tree : in Lock_id) is
  begin 
    Modify_block_non_exclusive (The_tree => The_tree,
                                       Value    => 1);             
  end Increment_block_non_exclusive;
 
  Procedure Decrement_block_non_exclusive (The_tree : in Lock_id) is
  begin 
    Modify_block_non_exclusive (The_tree => The_tree,
                                       Value    => -1);             
  end Decrement_block_non_exclusive;
 
  Procedure Lock_sub_tree (The_tree     : in Lock_id;
                           Request_type : in Access_type) is
    Start_Depth       : NATURAL;
    The_value         : Lock_node;
    The_Tree_Node     : Tree_manager.Tree_Node;
  begin 
    The_Tree_Node := Lock_id_to_Tree_Node (The_tree);
    The_value     := Tree_manager.Value (From_Node => The_Tree_Node);
    Start_depth   := Tree_manager.Depth (This_Node => The_Tree_Node);
    UPDATE_LOOP:
    loop                       
      case Request_type is
        when Non_exclusive =>
          The_value.Type_of_lock := Locked_non_exclusive;
        when Exclusive =>
          The_value.Type_of_lock := Locked_exclusive;
        when others =>
          null;
      end case;
      The_value.Number_of_locks := The_value.Number_of_locks + 1;
      Tree_manager.Update_Node (The_Tree_Node, The_value);
      The_Tree_Node := Tree_manager.Next_Node (Which_Node => The_Tree_Node);
      if The_Tree_Node = Tree_manager.Empty_Node then
        exit UPDATE_LOOP;
      elsif Tree_manager.Depth (This_Node => The_Tree_Node)
                                           <= Start_Depth then
        exit UPDATE_LOOP;
      end if;
      The_value := Tree_manager.Value (From_Node => The_Tree_Node);
    end loop UPDATE_LOOP;
 
  exception
    when Tree_manager.Tree_exception => raise Invalid_lock_id;

  end Lock_sub_tree;
 
  Procedure Unlock_sub_tree (The_tree     : in Lock_id) is
    Start_Depth       : NATURAL;
    The_value         : Lock_node;
    The_Tree_Node     : Tree_manager.Tree_Node;
  begin 
    The_Tree_Node := Lock_id_to_Tree_Node (The_tree);
    The_value     := Tree_manager.Value (From_Node => The_Tree_Node);
    Start_depth   := Tree_manager.Depth (This_Node => The_Tree_Node);
    UPDATE_LOOP:
    loop                       
      The_value.Number_of_locks := The_value.Number_of_locks - 1;
      if The_value.Number_of_locks = 0 then
        The_value.Type_of_lock := Unlocked;
      end if;
      Tree_manager.Update_Node (The_Tree_Node, The_value);
      The_Tree_Node := Tree_manager.Next_Node (Which_Node => The_Tree_Node);
      if The_Tree_Node = Tree_manager.Empty_Node then
        exit UPDATE_LOOP;
      elsif Tree_manager.Depth (This_Node => The_Tree_Node)
                                           <= Start_Depth then
        exit UPDATE_LOOP;
      end if;
      The_value := Tree_manager.Value (From_Node => The_Tree_Node);
    end loop UPDATE_LOOP;
 
  exception
    when Tree_manager.Tree_exception => raise Invalid_lock_id;
              
  end Unlock_sub_tree;
 
  Function Valid_unlock (The_tree : in Lock_id) return BOOLEAN is
    Start_Depth       : NATURAL;
    The_parent_value,
    The_value         : Lock_node;
    The_Parent_Node,
    The_Tree_Node     : Tree_manager.Tree_Node;
    Release_flag      : BOOLEAN;
  begin 
    The_Tree_Node := Lock_id_to_Tree_Node (The_tree);
    The_value := Tree_manager.Value (From_Node => The_Tree_Node);
    if The_value.Number_of_locks > 0 then
      The_Parent_Node := Tree_manager.Travel_Node  (From_Node =>
                                                           The_Tree_Node,
                                                      Direction =>
                                                 Tree_Manager.To_Parent);
      if The_Parent_Node /= Tree_Manager.Empty_Node then
        The_parent_value := Tree_Manager.Value (From_Node =>
                                                       The_Parent_Node);
        Release_flag := (The_parent_value.Type_of_lock = Unlocked) or
                   (The_value.Type_of_lock = Locked_non_exclusive and
                    The_parent_value.Type_of_lock = Locked_non_exclusive and
                    The_parent_value.Number_of_locks < 
                    The_value.Number_of_locks);
      else
        Release_Flag := TRUE;    
      end if;
    else 
      Release_flag := FALSE;
    end if;
 
    return Release_flag;
 
  exception
    when Tree_manager.Tree_exception => raise Invalid_lock_id;
              
  end Valid_unlock;
  
  Function Request_result (Request_type : in Access_type;
                           Status       : in Lock_status;
                           The_lock     : in Lock_id) return BOOLEAN is
  Temp_boole : BOOLEAN;
  begin
    case Status is
     when Unlocked =>
       if Request_type = Non_exclusive then
         Temp_boole := Non_exclusive_accept (The_tree => The_lock);
       else
         Temp_boole := TRUE;
       end if;
     when Locked_non_exclusive =>
       if Request_type = Non_exclusive then
         Temp_boole := Non_exclusive_accept (The_tree => The_lock);
       else
         Temp_boole := FALSE;
       end if;
     when Locked_exclusive =>
       Temp_boole := FALSE;
     when others =>
       null;
   end case;
   if Temp_boole then
     Lock_sub_tree (The_tree     => The_lock,
                    Request_type => Request_type);
   end if;
   return Temp_boole;
 end Request_result;


  begin  

    loop
    begin
      select
        accept New_lock_tree (The_tree : out Lock_id) do
          The_tree := Tree_Node_to_Lock_id (Tree_manager.Initialize_Tree
                                         (Root_value => New_Node));
          end New_lock_tree;

        or accept Add_sub_lock (To_lock  : in     Lock_id;
                                New_lock :    out Lock_id) do
          begin
            Temp_tree_node := Lock_id_to_Tree_Node (To_lock);
            The_Tree_Node := Tree_manager.Insert_Node
                                         (To_Node => Temp_tree_node,
                                          New_Value => New_Node,
                                          Direction =>
                                                Tree_manager.To_Child);
            New_lock := Tree_Node_to_Lock_id (The_Tree_Node);
            
            exception
              when Tree_manager.Tree_exception => raise Invalid_lock_id;
              
            end;
          end Add_sub_lock;
          
        or accept Dispose_lock_tree (The_tree : in Lock_id) do
          begin
            The_Tree_Node := Lock_id_to_Tree_Node (The_tree);
            Tree_manager.Terminate_Tree (Root_Node => The_Tree_Node);
            
            exception
              when Tree_manager.Tree_exception => raise Invalid_lock_id;
              
            end;
          end Dispose_lock_tree;
          
        or accept Request_lock (The_lock        : in     Lock_id;
                                Request_type    : in     Access_type;
                                Request_granted :    out BOOLEAN) do
          begin
            Request_granted := Request_result (Request_type => Request_type,
                                               Status       => Status_sub_tree
                                                                 (The_tree =>
                                                                    The_lock),
                                               The_lock     => The_lock);
 
            exception
              when Tree_manager.Tree_exception => raise Invalid_lock_id;
              
            end;
          end Request_lock;
          
        or accept  Nowait_request_lock  (The_lock        : in     Lock_id;
                                         Request_type    : in     Access_type;
                                         Locked_list_ptr :    out
                                                         Unavailable_access;
                                         Lock_acquired   :    out BOOLEAN) do
          begin
            Check_sub_tree (The_tree        => The_lock,
                            Return_list_ptr => The_access,
                            Return_status   => The_status);
            Locked_list_ptr := The_access;
            Lock_acquired := Request_result (Request_type => Request_type,
                                             Status       => The_status,
                                             The_lock     => The_lock);

            exception
              when Tree_manager.Tree_exception => raise Invalid_lock_id;

            end;
          end Nowait_request_lock;
        
        or accept Release_lock (The_lock : in Lock_id) do
          begin
          if Valid_unlock (The_tree => The_lock) then
            Unlock_sub_tree (The_tree => The_lock);
          else
            raise Release_error;
          end if;
            
          exception
            when Tree_manager.Tree_exception => raise Invalid_lock_id;
              
          end;
          end Release_lock;
        
        or accept Block_non_exclusive (The_lock : in Lock_id) do
          begin
          Increment_block_non_exclusive (The_tree => The_lock);
            
          exception
            when Tree_manager.Tree_exception => raise Invalid_lock_id;
              
          end;
          end Block_non_exclusive;

        or accept Unblock_non_exclusive (The_lock : in Lock_id) do
          begin
          Decrement_block_non_exclusive (The_tree => The_lock);
             
          exception
            when Tree_manager.Tree_exception => raise Invalid_lock_id;
              
          end;
          end Unblock_non_exclusive;
        
        or accept Status_lock (The_lock        : in     Lock_id;
                               Return_status   :    out Lock_status) do
          The_value := Tree_manager.Value (From_Node =>
                             Lock_id_to_Tree_Node (The_lock));
          if The_value /= Invalid_Node then
            Return_status := The_Value.Type_of_Lock;
          else
            raise Invalid_lock_id;
          end if;
          end Status_lock;
          
        or terminate;    
      end select;
 
    exception            
 
      when Invalid_lock_id =>
        null ;
      when Release_error =>
        null ;
      when others =>
        raise;
    
    end;    
    end loop;
 
  end Lock_task;
 
begin 
  null;
end Lock_manager;
 
'
]

{ #category : #'addit. arts' }
AdaTestSample class >> lockmgrAds [
	
	^'Package Lock_manager is

  type Lock_id is private;
  type Unavailable_access is private;
  type Access_type is (Non_exclusive, Exclusive);
  type Lock_status is (Unlocked,
                       Locked_non_exclusive,
                       Locked_exclusive);

  Function  New_lock_tree return Lock_id;

  Function  Add_sub_lock        (To_lock : in Lock_id) return Lock_id;

  Procedure Dispose_lock_tree   (The_lock : in Lock_id);

  Function  Wait_request_lock   (The_lock     : in Lock_id;
                                 Request_type : in Access_type)
                                                       return BOOLEAN;

  Function  Nowait_request_lock (The_lock     : in Lock_id;
                                 Request_type : in Access_type)
                                                      return BOOLEAN;
                                                      
  Procedure Nowait_request_lock  (The_lock        : in     Lock_id;
                                  Request_type    : in     Access_type;
                                  Locked_list_ptr :    out Unavailable_access;
                                  Lock_acquired   :    out BOOLEAN);

  Procedure Release_lock         (The_lock : in Lock_id);

  Function  Status_lock          (The_lock : in Lock_id)
                                                      return Lock_status;
                                                      
  Procedure Find_first_element   (The_list_ptr   : in     Unavailable_access;
                                  First_node_ptr :    out Unavailable_access;
                                  First_lock_id  :    out Lock_id;
                                  Item_exists    :    out BOOLEAN);

  Procedure Find_next_element    (The_list_ptr  : in     Unavailable_access;
                                  This_node_ptr : in     Unavailable_access;
                                  Next_node_ptr :    out Unavailable_access;
                                  Next_lock_id  :    out Lock_id;
                                  Item_exists   :    out BOOLEAN);

  Procedure Dispose_lock_list    (The_list_ptr  : in out Unavailable_access);

  Invalid_list_access, Invalid_lock_id, Release_error  : exception;

private

  type Lock_node;

  type Lock_id is access Lock_node;
  
  type Unavailable_node;
  
  type Unavailable_access is access Unavailable_node;

end Lock_manager;


'
]

{ #category : #'addit. arts' }
AdaTestSample class >> nrdrdtreAdb [
	
	^'  with unchecked_deallocation ;
  
  package body Unordered_Tree is  
    
    type Branch is record
           Data        : Item_To_Manage ;
           Parent      : Tree_Node      ;
           Child       : Tree_Node      ;
           Sibling     : Tree_Node      ;
           Last_Sibling: Tree_Node      ;
           Depth       : Natural        ;
         end record ;
         
    procedure free_node is new unchecked_deallocation
                                       ( Object => Branch      ,
                                         Name   => Tree_Node   ) ;
                                         
    Function Initialize_Tree ( Root_Value : in Item_To_Manage ) 
                                       return Tree_Node is
      new_tree : tree_node ;
    begin 
      new_tree := new Branch ;
      new_tree.all := ( Root_Value , null , null , null, null, 0 ) ;
      return new_tree ;
    end Initialize_Tree ;
    
    Procedure Terminate_Tree ( Root_Node : in out Tree_Node ) is
 
    Root_Depth : Natural;      
    The_Next_Node,
    This_Node  : Tree_Node;
      
    begin 
      if Root_Node /= Empty_Node then
        if Root_Node.Parent /= Empty_Node then               
          if Root_Node.Last_Sibling = Empty_Node then        
            Root_Node.Parent.Child := Root_Node.Sibling;
          else                                               
            Root_Node.Last_Sibling.Sibling := Root_Node.Sibling;
          end if;
        end if; 
        Root_Depth := Root_Node.Depth;
        This_Node := Root_Node;
        loop
          The_Next_Node := Next_Node (This_Node);
          This_Node.Data := Illegal_Value;
          free_node (This_Node);
          if The_Next_Node = Empty_Node then
            exit; 
          elsif The_Next_Node.Depth <= Root_Depth then
            exit;
          end if;
          This_Node := The_Next_Node;
        end loop;
      else
        raise Tree_Exception;
      end if ;
    end Terminate_Tree ;
    
    Function  Insert_Node ( To_Node   : in Tree_Node          ;
                            New_Value : in Item_To_Manage     ;
                            Direction : in Movement_Direction ) 
                                                 return Tree_Node is
      New_Node         : Tree_Node ;
        
    begin 
      New_Node := new Branch;
      New_Node.all := (New_Value, null, null, null, null,0);
      If Direction = To_Child then
        New_Node.Parent := To_Node;
        New_Node.Depth := To_Node.Depth + 1;
        If To_Node.Child /= null then
          if To_Node.Child.Sibling /= Empty_Node then
            New_Node.Sibling := To_node.Child.Sibling;
            New_Node.Sibling.Last_Sibling := New_Node;
          end if;
          To_Node.Child.Sibling := New_Node;
          New_Node.Last_Sibling := To_Node.Child;
        else
          To_Node.Child := New_Node;
        end if;
      elsif Direction = To_Sibling then
        New_Node.Parent := To_Node.Parent;
        New_Node.Depth := To_Node.Depth;
        If To_Node.Sibling /= null then
          New_Node.Sibling := To_Node.Sibling;
          New_Node.Sibling.Last_Sibling := New_Node;
        end if;
        To_Node.Sibling := New_Node;
        New_Node.Last_Sibling := To_Node;
      else
        raise Tree_Exception ;
      end if ;
      return New_Node ;
    end Insert_Node ;
 
    Procedure Delete_Node ( Which_Node  : in out Tree_Node) is
      
    Child_Depth : Natural;
    The_Next_Node,
    This_Node   : Tree_Node;
    
    begin
      if Which_Node /= Empty_Node then
        if Which_Node.Parent = Empty_Node then          
          Terminate_Tree (Which_Node);                  
          raise Empty_Tree_After_Deletion;
        else
          if Which_Node.Last_Sibling /= Empty_Node then 
          
          
            Which_Node.Last_Sibling.Sibling := Which_Node.Sibling; 
            Which_Node.Sibling.Last_Sibling := Which_Node.Last_Sibling;
          else
          
          
            Which_Node.Parent.Child := Which_Node.Sibling;
            Which_Node.Sibling.Last_Sibling := Empty_Node;
          end if;
          if Which_Node.Child /= Empty_Node then       
            if Which_Node.Parent.Child = Empty_Node then
              Which_Node.Parent.Child := Which_Node.Child;
            else
              This_Node := Which_Node.Parent.Child;
              loop
                exit when This_Node.Sibling = Empty_Node;
                This_Node := This_Node.Sibling;
              end loop;
              This_Node.Sibling := Which_Node.Child;
              Which_Node.Child.Last_Sibling := This_Node;
            end if;
            Which_Node.Child.Parent := Which_Node.Parent;
            Child_Depth := Which_Node.Child.Depth;
            This_Node := Which_Node.Child;
            loop                                       
              The_Next_Node := Next_Node (This_Node);  
              This_Node.Depth := This_Node.Depth - 1;
              exit when The_Next_Node = Empty_Node or 
                The_Next_Node.Depth <= Child_Depth;
              This_Node := The_Next_Node;
            end loop;
          end if;
          Which_Node.Data := Illegal_Value;
          free_node (Which_Node);                       
        end if;
      else
        raise Tree_Exception;
      end if;  
    end Delete_Node;
    
    Procedure Update_Node ( The_Node    : in Tree_Node       ;
                            New_Value   : in Item_To_Manage  ) is
    begin
      if The_Node = Empty_Node then
        raise Tree_Exception ;      
      else
        The_Node.Data := New_Value ;
      end if ;
    end Update_Node ;
    
    Function Value ( From_Node : in Tree_Node ) return Item_To_Manage is
    begin 
      if From_Node = Empty_Node then
        return Illegal_Value ;
      else
        return From_Node.Data ;
      end if ;
    end Value ;
    
    Function Next_Node ( Which_Node : in Tree_Node ) return Tree_Node is
    
    This_Node : Tree_Node;
    
    begin
      if Which_Node /= Empty_Node then
        if Which_Node.Child /= null then
          return Which_Node.Child;
        elsif Which_Node.Sibling /= null then
          return Which_Node.Sibling;
        elsif Which_Node.Parent /= null then
          This_Node := Which_Node.Parent;
          loop
            exit when This_Node.Parent = Empty_Node or
              This_Node.Sibling /= Empty_Node;
            This_Node := This_Node.Parent;
          end loop;
          return This_Node.Sibling;
        else
          return Empty_Node;
        end if;
      else 
        raise Tree_Exception;
      end if;
    end Next_Node;
    
    Function Travel_Node ( From_Node     : in Tree_Node          ;
                           Direction     : in Movement_Direction )
                                         return Tree_Node is
    begin 
      if From_Node /= Empty_Node then
        case Direction is 
          when To_Parent       => return From_Node.Parent       ;
          when To_Child        => return From_Node.Child        ;
          when To_Sibling      => return From_Node.Sibling      ;
          when To_Last_Sibling => return From_Node.Last_Sibling ;
        end case ;
      else
        raise Tree_exception;
      end if;
    end Travel_Node ;
    
    Function Depth (This_Node : in Tree_Node) return Natural is
      
    begin
      if This_Node /= Empty_Node then
        return This_Node.Depth;
      else
        raise Tree_exception;
      end if;
    end Depth;
    
  end Unordered_Tree ;  
  
'
]

{ #category : #'addit. webexamples' }
AdaTestSample class >> oneClassadb [
	
	^'
procedure OneClass is

  type A is tagged null record;

  procedure Print( Aa: in A );

  procedure Print( Aa: in A ) is

  begin
    Put( "I am an A" );
    New_Line;
  end;

  type B is new A with null record;



  procedure Print( Bb: in B );



  procedure Print( Bb: in B ) is

  begin

    Put( "I am a B" );

    New_Line;

  end;



  type C is new A with null record;



  procedure Print( Cc: in C );



  procedure Print( Cc: in C ) is

  begin

    Put( "I am a C" );

    New_Line;

  end;



  procedure Print_It( Aa: in A ) is

  begin

    Print( Aa );

  end;



  Bb: B;

  Cc: C;



begin -- Main procedure

  Print_It( Bb );

  Print_It( Cc );

end;'
]

{ #category : #'addit. webexamples' }
AdaTestSample class >> primesBySeive [
	"from http://sandbox.mc.edu/~bennet/ada/examples/sieve_adb.html"
	
	^'
with Gnat.Io; use Gnat.Io;
procedure Sieve is
   type Sieve_Arr_Type is array(Integer range <>) of Boolean;
   Max: Integer;
begin
   Put("Prime Search Maximum: ");
   Get(Max);

   declare
      Line_Max: constant := 12;

      IsPrime: Sieve_Arr_Type(2..Max) := (2..Max => True);

      Maybe_Prime, 
        Multiple: Integer;
      Line_Count: Integer;
   begin
      for Maybe_Prime in 2..Max loop

         if IsPrime(Maybe_Prime) then

            Multiple := 2*Maybe_Prime;
            while Multiple <= Max loop
               IsPrime(Multiple) := False;
               Multiple := Multiple + Maybe_Prime;
            end loop;

         end if;
      end loop;

      Line_Count := 0;
      for Maybe_Prime in 2..Max loop

         if IsPrime(Maybe_Prime) then

            if Line_Count >= Line_Max then
               New_Line;
               Line_Count := 0;
            else
               Put(" ");
            end if;

            Put(Maybe_Prime);
            Line_Count := Line_Count + 1;
         end if;
      end loop;

      if Line_Count > 0 then
         New_Line;
      end if;
   end;
end Sieve;'
]

{ #category : #'addit. arts' }
AdaTestSample class >> rlockmgrAdb [
	
	^'with Linked_List;
with Wakeup_scheduling; 
    
Package body Reliable_lock_manager is
  
 
  Empty_lock_id : constant Lock_id := Lock_id (Lock_manager.New_lock_tree); 
   
  Package Lock_list is new Linked_list (Item_to_manage => Lock_id,
                                        Illegal_value  => Empty_lock_id);
  use Lock_List; 
       
   
  type User_rec (D_flag: BOOLEAN := TRUE) is
    record
      User       : Lock_user_id;
      Has_lock   : Lock_list.List_node;
      case D_flag is
        when TRUE  => 
          Wants_lock : Lock_list.List_node;
        when FALSE =>
          null; 
      end case;
    end record; 
   
  Empty_user_rec: constant User_rec := (D_flag   => FALSE, 
                                        User     => CLOCK - 10000.0, 
                                        Has_lock => Lock_list.Empty_node);
   
  Package User_list is new Linked_list (Item_to_manage => User_rec,
                                        Illegal_value  => Empty_user_rec);
  use User_List; 
    
  The_id_list : User_list.List_node;   
   
  type Wakeup_designator is
    record
      User : Lock_user_id;
      Lock : Lock_id;
    end record; 
   
  Procedure Timed_lock_release (The_pair : in Wakeup_designator);
    
  Package Lock_timer is new Wakeup_scheduling (Wakeup_designator => 
                                                 Wakeup_designator,
                                               Signal            => 
                                                 Timed_lock_release); 
  
 
   
  Function Valid_user (The_user : in Lock_user_id) 
                                  return User_list.List_node is
   
  
  Temp_user : User_list.List_node; 
    
  begin
    Temp_user := User_list.Travel_node (From_node => The_id_list);
    loop
      exit when Temp_user = The_id_list;
      if User_list.Value (From_node => Temp_user).User = The_user then 
        return Temp_user;
      else
        Temp_user := User_list.Travel_node (From_node => Temp_user);
      end if; 
    end loop;
    return User_list.Empty_node; 
  end Valid_user;
    

  Procedure Timed_lock_release (The_pair : in Wakeup_designator) is
  
  Temp_user : User_list.List_node;
  
  begin
    if not (Bandit_checking) then           
      Temp_user := Valid_user (The_user => The_pair.User);
      if Temp_user = User_list.Empty_node then
        return;
      elsif Lock_list.Find_node (Inside_list => User_list.Value 
                                   (From_node => Temp_user).Has_lock,
                                 Old_value   => The_pair.Lock) = 
                                   Lock_list.Empty_node then
        return;
      end if;
    end if;
    Release_lock (The_lock => The_pair.Lock,
                  The_user => The_pair.User);
    exception
      when Invalid_lmgr_user_id => null;           
      when Invalid_lock_id      => null;           
  end Timed_lock_release;     
    

  Procedure Locate_lock (Lock       : in     Lock_id;
                         Non_owner  : in     Lock_user_id;
                         Owner_node :    out User_list.List_node;
                         Lock_node  :    out Lock_list.List_node) is
   
   
  Temp_lock   : Lock_list.List_node;
  Temp_user   : User_list.List_node; 
  The_user_rec: User_rec;
    
  begin
    Owner_node := User_list.Empty_node;
    Lock_node := Lock_list.Empty_node; 
    Temp_user := User_list.Travel_node (From_node => The_id_list);
    loop
      exit when Temp_user = The_id_list;
      The_user_rec := User_list.Value (From_node => Temp_user); 
      if The_user_rec.User /= Non_owner then 
        Temp_lock := Lock_list.Find_node (Inside_list => The_user_rec.Has_lock,
                                          Old_value   => Lock);
        if Temp_lock /= Lock_list.Empty_node then
          Owner_node := Temp_user; 
          Lock_node := Temp_lock; 
          exit; 
        end if;
      end if; 
      Temp_user := User_list.Travel_node (From_node => Temp_user);
    end loop;        
  end Locate_lock; 
   
   
  Function Located_lock_owner (Lock      : in Lock_id;
                               Non_owner : in Lock_user_id) 
                                         return User_list.List_node is
   
  The_owner: User_list.List_node;
  The_lock_node: Lock_list.List_node; 
   
  begin
    Locate_lock (Lock       => Lock,
                 Non_owner  => Non_owner,
                 Owner_node => The_owner,
                 Lock_node  => The_lock_node);
    return The_owner;
  end Located_lock_owner; 
    
   
  Function Located_lock_in_use (Lock      : in Lock_id;
                                Non_owner : in Lock_user_id) 
                                          return Lock_list.List_node is
   
  The_owner     : User_list.List_node;
  The_lock_node : Lock_list.List_node; 
   
  begin
    Locate_lock (Lock       => Lock,
                 Non_owner  => Non_owner,
                 Owner_node => The_owner,
                 Lock_node  => The_lock_node);
    return The_lock_node;
  end Located_lock_in_use; 
    
   
  Function Cycle_exists (Hopeful_user : in User_rec;
                         Wants_lock   : in Lock_id)    
                                        return BOOLEAN is
    
  Suspect_owner : User_list.List_node;
   
  Function Check_cycle (Start_user: in User_rec) return BOOLEAN is
   
  Wants_node       : Lock_list.List_node; 
  The_user_node    : User_list.List_node;
  The_user_rec     : User_rec; 
   
  begin
    Wants_node := Lock_list.Travel_node (From_node => Start_user.Wants_lock);
    loop
      exit when Wants_node = Start_user.Wants_lock;
      The_user_node := Located_lock_owner (Lock      => 
                                             Lock_list.Value 
                                               (From_node => Wants_node),
                                           Non_owner => Start_user.User);
      The_user_rec := User_list.Value (From_node => The_user_node); 
      if The_user_rec = Hopeful_user then
        return TRUE;
      elsif 
        Check_cycle (The_user_rec) then
          return TRUE;
      end if; 
      Wants_node := Lock_list.Travel_node (From_node => Wants_node);
    end loop;
    return FALSE; 
  end Check_cycle; 
   
  begin
    if Lock_list.Travel_node (From_node => Hopeful_user.Has_lock) =
                                           Hopeful_user.Has_lock then  
      return FALSE;    
    elsif Lock_list.Find_node (Inside_list => Hopeful_user.Has_lock,
                               Old_value   => Wants_lock) /= 
                                                       Lock_list.Empty_node then
      return TRUE;     
    else   
      Suspect_owner := Located_lock_owner (Lock      => Wants_lock,
                                           Non_owner => Hopeful_user.User);
      if Suspect_owner /= User_list.Empty_node then
        return Check_cycle (User_list.Value (From_node => Suspect_owner));
      else
        return FALSE; 
      end if; 
    end if;
  end Cycle_exists;
        
   
  Function  New_lock_tree return Lock_id is
   
  begin
    User_list.Initialize_List (New_list => The_id_list); 
    return Lock_id (Lock_manager.New_lock_tree);
  end New_lock_tree;
   
   
  Function  Add_sub_lock (To_lock : in Lock_id) 
                                    return Lock_id is
                                               
  begin
    return Lock_id (Lock_manager.Add_sub_lock (To_lock =>
                      Lock_manager.Lock_id (To_lock)));
  end Add_sub_lock; 
   
   
  Procedure Dispose_lock_tree    (The_lock     : in Lock_id) is
   
  begin
    User_list.Terminate_list (Root_node => The_id_list); 
    Lock_manager.Dispose_lock_tree (The_lock => 
                                      Lock_manager.Lock_id (The_lock));
  end Dispose_lock_tree;                   
    
    
  Function New_lock_user return Lock_user_id is
  
  This_id   : Lock_user_id;
  List_A,
  List_B    : Lock_list.List_node;
  Temp_user : User_list.List_node; 
  The_user  : User_rec;

  begin
    This_id := CLOCK;
    Temp_user := User_list.Travel_node (From_node => The_id_list);
    loop
      if User_list.Value (From_node => Temp_user).User = This_id then
        exit;                                   
      else
        Temp_user := User_list.Travel_node (From_node => Temp_user);
      end if;
      exit when Temp_user = The_id_list;        
    end loop;
    if Temp_user /= The_id_list then              
      This_id := User_list.Value (From_node =>
                   User_list.Find_last_node (Inside_list => The_id_list)).User
                     + DURATION''SMALL;
    end if; 
    case Deadlock_checking is
      when TRUE  => 
        Lock_list.Initialize_list (New_list => List_A);
        Lock_list.Initialize_list (New_list => List_B);
        The_user := (D_flag     => TRUE,
                     User       => This_id,
                     Has_lock   => List_A,
                     Wants_lock => List_B);
      when FALSE =>
        Lock_list.Initialize_list (New_list => List_A);
        The_user := (D_flag   => FALSE,
                     User     => This_id,
                     Has_lock => List_A);
    end case; 
    User_list.Append_node (To_list   => The_id_list,
                           New_value => The_user,
                           New_node  => Temp_user);  
    return This_id;
  end New_lock_user;
  
   
  Procedure Release_lock_user    (The_user     : in Lock_user_id) is
   
  User_lock_list,
  This_node : Lock_list.List_node;
  User_node : User_list.List_node;
  The_lock  : Lock_id;
   
  begin 
    User_node := Valid_user (The_user => The_user);
    if User_node /= User_list.Empty_node then
      User_lock_list := User_list.Value (From_node => User_node).Has_lock;
      This_node := Lock_list.Travel_node (From_node => User_lock_list);
      loop 
        exit when This_node = User_lock_list;
        The_lock := Lock_list.Value (From_node => This_node);     
        Lock_manager.Release_lock (Lock_manager.Lock_id (The_lock));
        if Timed_requests then       
          begin
            Lock_timer.Unschedule_wakeup (The_wakeup => (User => The_user,
                                                         Lock => The_lock));
            exception
              when Lock_timer.Invalid_wakeup_designator => null;
          end;
        end if;
        This_node := Lock_list.Travel_node (From_node => This_node);
      end loop;
      User_lock_list := User_list.Value (From_node => User_node).Has_lock;
      Lock_list.Terminate_list (Root_node => User_lock_list);
      if Deadlock_checking then 
        User_lock_list := User_list.Value (From_node => User_node).Wants_lock;
        Lock_list.Terminate_list (Root_node => User_lock_list);
       end if; 
      User_list.Delete_node (The_node => User_node);
    else
      raise Invalid_lmgr_user_id; 
    end if; 
  end Release_lock_user;
   
   
  Function  New_nowait_lock  (The_lock     : in Lock_id;
                              The_user     : in Lock_user_id; 
                              Request_type : in Access_type)
                                             return Lock_list.List_node is
    
  Lock_node: Lock_list.List_node;
  User_node: User_list.List_node;
                                            
  begin
    User_node := Valid_user (The_user => The_user);
    if User_node /= User_list.Empty_node then
      if Lock_manager.Nowait_request_lock (The_lock     => 
                                             Lock_manager.Lock_id (The_lock),
                                           Request_type =>
                                             Lock_manager.Access_type 
                                               (Request_type)) then
        Lock_list.Append_node (To_list  => User_list.Value (From_node => 
                                             User_node).Has_lock,
                               New_value => The_lock,
                               New_node  => Lock_node);
        return Lock_node;
      else
        return Lock_list.Empty_node;
      end if;
    else
      raise Invalid_lmgr_user_id;
    end if;
  end New_nowait_lock;
          
   
  Function New_wait_lock    (The_lock     : in Lock_id;
                             The_user     : in Lock_user_id; 
                             Request_type : in Access_type)
                                            return Lock_list.List_node is
   
  Lock_node: Lock_list.List_node;
  User_node: User_list.List_node;
  
  begin
    User_node := Valid_user (The_user => The_user);
    if User_node /= User_list.Empty_node then
      if Lock_manager.Wait_request_lock (The_lock     => 
                                           Lock_manager.Lock_id (The_lock),
                                         Request_type =>
                                           Lock_manager.Access_type 
                                             (Request_type)) then
        Lock_list.Append_node (To_list  => User_list.Value (From_node => 
                                             User_node).Has_lock,
                               New_value => The_lock,
                               New_node  => Lock_node);
        return Lock_node;
      end if;
    else
      raise Invalid_lmgr_user_id;
    end if;
  end New_wait_lock;
      
   
  Procedure Get_wait_lock    (The_lock        : in     Lock_id;
                              The_user        : in     Lock_user_id; 
                              Request_type    : in     Access_type;
                              New_lock_node   :    out Lock_list.List_node) is

      
  The_flag,
  Valid_ptr    : BOOLEAN;
  Wants_lock   : Lock_manager.Lock_id;
  The_list_ptr,
  The_node_ptr : Lock_manager.Unavailable_access;
  The_user_rec : User_rec;
  Wait_node    : Lock_list.List_node;
  User_node    : User_list.List_node;
  
  begin
    User_node := Valid_user (The_user => The_user);
    if User_node /= User_list.Empty_node then
      The_user_rec := User_list.Value (From_node => User_node);
      Lock_manager.Nowait_request_lock (The_lock        => 
                                          Lock_manager.Lock_id (The_lock),
                                        Request_type    => 
                                          Lock_manager.Access_type 
                                            (Request_type),
                                        Locked_list_ptr => The_list_ptr,
                                        Lock_acquired   => The_flag);
      if The_flag = FALSE then   

        Lock_manager.Find_first_element (The_list_ptr   => The_list_ptr,
                                         First_node_ptr => The_node_ptr,
                                         First_lock_id  => Wants_lock,
                                         Item_exists    => Valid_ptr);
        loop
          exit when Valid_ptr = FALSE;
          if Cycle_exists (Hopeful_user => The_user_rec,
                           Wants_lock   => Lock_id (Wants_lock)) then 
            Lock_manager.Dispose_lock_list (The_list_ptr => The_list_ptr);
            raise Deadlock_prone_lock_request;
          else
            Lock_manager.Find_next_element (The_list_ptr  => The_list_ptr,
                                            This_node_ptr => The_node_ptr,
                                            Next_node_ptr => The_node_ptr,
                                            Next_lock_id  => Wants_lock,
                                            Item_exists   => Valid_ptr);
          end if;
        end loop;
        Lock_list.Append_node (To_list   => The_user_rec.Wants_lock,
                               New_Value => The_lock, 
                               New_node  => Wait_node);
        if Lock_manager.Wait_request_lock (The_lock     => 
                                             Lock_manager.Lock_id (The_lock),
                                           Request_type =>
                                             Lock_manager.Access_type 
                                               (Request_type)) then
           
   
          Lock_list.Delete_node (The_node => Wait_node);
          Lock_manager.Dispose_lock_list (The_list_ptr => The_list_ptr);
        end if;
      end if;
      Lock_list.Append_node (To_list   => The_user_rec.Has_lock,
                             New_value => The_lock,
                             New_node  => New_lock_node);
    else
      raise Invalid_lmgr_user_id;  
    end if; 
  end Get_wait_lock;
   
   
  Function  Wait_request_lock    (The_lock     : in Lock_id;
                                  The_user     : in Lock_user_id; 
                                  Request_type : in Access_type)
                                                 return BOOLEAN is
  
  Temp_lock : Lock_list.List_node;
   
  begin
    if Deadlock_checking then
      Get_wait_lock (The_lock        => The_lock,      
                     The_user        => The_user,      
                     Request_type    => Request_type,
                     New_lock_node   => Temp_lock);
      return TRUE;
    else
      Temp_lock := New_wait_lock (The_lock     => The_lock,  
                                  The_user     => The_user,
                                  Request_type => Request_type);
      return TRUE;
    end if; 
  end Wait_request_lock; 
   
   
  Function  Nowait_request_lock  (The_lock     : in Lock_id;
                                  The_user     : in Lock_user_id; 
                                  Request_type : in Access_type)
                                                 return BOOLEAN is
  
  begin
    if New_nowait_lock (The_lock     => The_lock,
                        The_user     => The_user,
                        Request_type => Request_type) /= 
                                                      Lock_list.Empty_node then
      return TRUE;
    else
      return FALSE;
    end if;
  end Nowait_request_lock;                            
   
   
  Function  Wait_request_lock    (The_lock     : in Lock_id;
                                  The_user     : in Lock_user_id; 
                                  Request_type : in Access_type;
                                  Time_limit   : in DURATION)
                                                 return BOOLEAN is
                                                 
  
  Temp_lock : Lock_list.List_node; 
                                                 
  begin
    if Timed_requests = FALSE then
      raise No_timed_lock_requests;
    else 
      if Deadlock_checking then
        Get_wait_lock (The_lock        => The_lock,      
                       The_user        => The_user,      
                       Request_type    => Request_type,
                       New_lock_node   => Temp_lock);
      else
        Temp_lock := New_wait_lock (The_lock     => The_lock,  
                                    The_user     => The_user,
                                    Request_type => Request_type);
      end if; 
      if Temp_lock /= Lock_list.Empty_node then
        Lock_timer.Schedule_one_shot_wakeup 
          (The_wakeup  => (User => The_user,
                           Lock => The_lock),
           Signal_time => (CLOCK + Time_limit)); 
        return TRUE;
      end if; 
    end if;
  end Wait_request_lock; 
   
   
  Function  Nowait_request_lock  (The_lock     : in Lock_id;
                                  The_user     : in Lock_user_id; 
                                  Request_type : in Access_type;
                                  Time_limit   : in DURATION)
                                                 return BOOLEAN is
  
  Temp_lock : Lock_list.List_node; 
   
  begin
    if Timed_requests = FALSE then
      raise No_timed_lock_requests;
    else 
      Temp_lock := New_nowait_lock (The_lock     => The_lock,
                                    The_user     => The_user,
                                    Request_type => Request_type);
      if Temp_lock /= Lock_list.Empty_node then
        Lock_timer.Schedule_one_shot_wakeup 
          (The_wakeup  => (User => The_user,
                           Lock => The_lock),
           Signal_time => (CLOCK + Time_limit)); 
        return TRUE;
      else
        return FALSE;
      end if; 
    end if;
  end Nowait_request_lock; 
   
   
  Procedure Change_time_limit    (The_lock   : in Lock_id;
                                  The_user   : in Lock_user_id; 
                                  Time_limit : in DURATION) is
                                  
  
  Temp_user   :   User_list.List_node; 
  The_lock_node: Lock_list.List_node;
   
  begin
    if not (Timed_Requests) then
      raise No_timed_lock_requests;
    else
      Temp_user := Valid_user (The_user => The_user); 
      if Temp_user = User_list.Empty_node then
        raise Invalid_lmgr_user_id;
      else 
        if Lock_list.Find_node (Inside_list => User_list.Value 
                                                 (From_node => Temp_user).
                                                   Has_lock,
                                               Old_value  => The_lock) =
                                                 Lock_list.Empty_node then 
          raise Invalid_lock_id;
        else
          begin
            Lock_timer.Unschedule_wakeup (The_wakeup => (User => The_user,
                                                         Lock => The_lock));
            exception  
              when Lock_timer.Invalid_wakeup_designator => null;
          end;
          Lock_timer.Schedule_one_shot_wakeup 
            (The_wakeup  => (User => The_user,
                             Lock => The_lock),
             Signal_time => (CLOCK + Time_limit));
        end if; 
      end if;
    end if;
  end Change_time_limit; 
   
   
  Procedure Release_lock         (The_lock : in Lock_id;
                                  The_user : in Lock_user_id) is
                                  
  Found_lock : Lock_list.List_node; 
  Found_user : User_list.List_node; 
                                   
  begin 
    Found_user := Valid_user (The_user => The_user); 
    if Found_user = User_list.Empty_node then
      raise Invalid_lmgr_user_id;
    else 
      Found_lock := Lock_list.Find_node (Inside_list => User_list.Value 
                                          (From_node => Found_user).Has_lock,
                                         Old_value   => The_lock);
      if Found_lock = Lock_list.Empty_node then 
        if Bandit_checking then 
          raise Invalid_lock_id;
        else         
          Found_lock := Located_lock_in_use (Lock       => The_lock,
                                             Non_owner  => 
                                              User_list.Value 
                                                (From_node => Found_user).User);
          if Found_lock = Lock_list.Empty_node then
            raise Invalid_lock_id;
          end if; 
        end if;
      end if;
      Lock_manager.Release_lock (Lock_manager.Lock_id (The_lock)); 
      Lock_list.Delete_node (The_node => Found_lock);
    end if; 
  end Release_lock;
   
   
  Function  Status_lock          (The_lock : in Lock_id;
                                  The_user : in Lock_user_id)
                                                 return Lock_status is
                                                 
  begin
    if Valid_user (The_user => The_user) /= User_list.Empty_node then
      return Lock_status (Lock_manager.Status_lock 
                          (The_lock => Lock_manager.Lock_id (The_lock)));
    else
      raise Invalid_lmgr_user_id;
    end if;
  end Status_lock; 
    
end Reliable_lock_manager; 
 
 
'
]

{ #category : #'addit. arts' }
AdaTestSample class >> rlockmgrAds [
	
	^'with CALENDAR; use CALENDAR;
with Lock_Manager;
  
generic 
  Bandit_checking,
  Deadlock_checking,
  Timed_requests   : BOOLEAN := TRUE;
  
Package Reliable_lock_manager is
 
  type Lock_user_id is private;
  
  
  type Lock_id is new Lock_manager.lock_id; 
  type Access_type is new Lock_manager.Access_type; 
  type Lock_status is new Lock_manager.Lock_status; 
    
  Function  New_lock_tree return Lock_id;
 
  Function  Add_sub_lock         (To_lock      : in Lock_id) 
                                                 return Lock_id;
 
  Procedure Dispose_lock_tree    (The_lock     : in Lock_id);
  
  Function  New_lock_user return Lock_user_id;
  
  Procedure Release_lock_user    (The_user     : in Lock_user_id); 
 
  Function  Wait_request_lock    (The_lock     : in Lock_id;
                                  The_user     : in Lock_user_id; 
                                  Request_type : in Access_type)
                                                 return BOOLEAN;
 
  Function  Nowait_request_lock  (The_lock     : in Lock_id;
                                  The_user     : in Lock_user_id; 
                                  Request_type : in Access_type)
                                                 return BOOLEAN;
 
  Function  Wait_request_lock    (The_lock     : in Lock_id;
                                  The_user     : in Lock_user_id; 
                                  Request_type : in Access_type;
                                  Time_limit   : in DURATION)
                                                 return BOOLEAN;
 
  Function  Nowait_request_lock  (The_lock     : in Lock_id;
                                  The_user     : in Lock_user_id; 
                                  Request_type : in Access_type;
                                  Time_limit   : in DURATION)
                                                 return BOOLEAN;
 
  Procedure Change_time_limit    (The_lock     : in Lock_id;
                                  The_user     : in Lock_user_id; 
                                  Time_limit   : in DURATION);
 
  Procedure Release_lock         (The_lock     : in Lock_id;
                                  The_user     : in Lock_user_id);
 
  Function  Status_lock          (The_lock     : in Lock_id;
                                  The_user     : in Lock_user_id)
                                                 return 
                                                   Lock_status;
 
  Deadlock_prone_lock_request,
  Invalid_lock_id, 
  Invalid_lmgr_user_id,
  No_timed_lock_requests      : exception;
  
  private
    type Lock_user_id is new TIME; 
  
end Reliable_lock_manager;
 
'
]

{ #category : #'addit. arts' }
AdaTestSample class >> rtskpoolAdb [
	
	^'with Linked_list;
with Wakeup_scheduling;
 
Package body Reliable_task_pool is

  type Pool_user_rec (D_flag: BOOLEAN := TRUE) is
    record
      User: Pool_user_id;
      case D_flag is
        when TRUE  =>
          Tasks_owned  : NATURAL;
          Tasks_wanted : NATURAL;
        when FALSE =>
          null;
      end case;
    end record; 
    
  
  type Task_in_use is
    record
      Rtask: Task_designator;
      User: Pool_user_id;
    end record;
    
        
  type Task_use_array is array (NATURAL range <>) of Task_in_use;
    
  Max_task_num   : NATURAL := Static_size + 
                              Dynamic_limit;          
  Task_master    : Task_use_array (1..Max_task_num);  
  Empty_user_rec : constant Pool_user_rec := (D_flag => FALSE,
                                              User   => CLOCK - 10000.0);
  Task_count     : NATURAL := 0;                      

  Package Pool_user_list is new Linked_list (Item_to_manage => Pool_user_rec,
                                             Illegal_value  => Empty_user_rec);
  use Pool_user_list;     

  The_user_list  : Pool_user_list.List_node;          
   
  Procedure Timed_task_release (Task_rec: in Task_in_use);
  
  Package Task_timer is new Wakeup_scheduling (Wakeup_designator => 
                                                 Task_in_use,
                                               Signal            => 
                                                 Timed_task_release);
                                                 

  Procedure Add_new_task (Rtask : in Task_designator;
                          User  : in Pool_user_id) is
                          
  begin
    Task_count := Task_count + 1;
    Task_master (Task_count).Rtask := Rtask;
    Task_master (Task_count).User := User;
  end Add_new_task;
  
  
  Procedure Remove_task (Task_index : in NATURAL) is
  
  begin
    Task_master (Task_index) := Task_master (Task_count);  
    Task_count := Task_count - 1;                          
  end Remove_task;
  
  
  Function Valid_user (The_user : in Pool_user_id) 
                                  return Pool_user_list.List_node is
                                  
  
  Temp_user : Pool_user_list.List_node;
                                  
  begin
    Temp_user := Pool_user_list.Travel_node (From_node => The_user_list);
    loop
      exit when Temp_user = The_user_list;
      if Pool_user_list.Value (From_node => Temp_user).User = The_user then
        return Temp_user;
      else
        Temp_user := Pool_user_list.Travel_node (From_node => Temp_user);
      end if;
    end loop;
    return Pool_user_list.Empty_node;
  end Valid_user;
  
  
  Function Valid_task_index (The_task: Task_designator) return NATURAL is
  
  begin
    for i in 1..Task_count loop
      if Task_master (i).Rtask = The_task then
        return i;
      end if;
    end loop;
    return 0;
  end Valid_task_index;


  Procedure Timed_task_release (Task_rec: in Task_in_use) is
  
  The_task_index : NATURAL;
  
  begin
    if not (Bandit_checking) then 
      The_task_index := Valid_task_index (The_task => Task_rec.Rtask);
      if The_task_index = 0 then
        return; 
      elsif Task_master (The_task_index).User /= Task_rec.User then
        return;
      end if;
    end if;
    Release_task (The_user => Task_rec.User,     
                  The_task => Task_rec.Rtask);
    exception
      when Invalid_pool_user_id => null;         
      when Invalid_task_id      => null;         
  end Timed_task_release;

  
  Function  New_pool_user return Pool_user_id is 
  
  This_id   : Pool_user_id;
  Temp_user : Pool_user_list.List_node; 
  The_user  : Pool_user_rec;

  begin
    This_id := CLOCK;
    Temp_user := Pool_user_list.Travel_node (From_node => The_user_list);
    loop
      if This_id = Pool_user_list.Value (From_node => Temp_user).User then
        exit;                               
      else
        Temp_user := Pool_user_list.Travel_node (From_node => Temp_user);
      end if;
      exit when Temp_user = The_user_list;  
    end loop;
    if Temp_user /= The_user_list then      
      This_id := Pool_user_list.Value (From_node =>
                   Pool_user_list.Find_last_node (Inside_list => 
                     The_user_list)).User + DURATION''SMALL;
    end if;
    case Deadlock_checking is
      when TRUE  => 
        The_user := (D_flag       => TRUE,
                     User         => This_id,
                     Tasks_owned  => 0,
                     Tasks_wanted => 0);
      when FALSE =>
        The_user := (D_flag   => FALSE,
                     User     => This_id);
    end case; 
    Pool_user_list.Append_node (To_list   => The_user_list,
                                New_value => The_user,
                                New_node  => Temp_user);  
    return This_id;
  end New_pool_user;
  
 
  Procedure Release_pool_user    (The_user   : in     Pool_user_id) is 
  
  The_user_node: Pool_user_list.List_node;
  The_user_val : Pool_user_rec;
  
  begin
    The_user_node := Valid_user (The_user => The_user);
    if The_user_node = Empty_node then
      raise Invalid_pool_user_id;
    else
      for i in 1..Task_count loop              
        if Task_master (i).User = The_user then 
          The_pool.Release_task (The_task => The_pool.Task_designator 
                                               (Task_master (i).Rtask));
          Remove_task (Task_index => i);
          if Timed_requests then         
            begin                   
              Task_timer.Unschedule_wakeup (The_wakeup => (User  => 
                                                             The_user,
                                                           Rtask => 
                                                             Task_master (i).
                                                               Rtask));
              exception   
                when Task_timer.Invalid_wakeup_designator => null;
            end;
          end if;
        end if;
      end loop;
      Pool_user_list.Delete_node (The_node => The_user_node); 
    end if;
  end Release_pool_user;
 

  Function  Request_task         (The_user   : in     Pool_user_id)
                                               return Task_designator is
  
  Valid_task     : BOOLEAN;
  The_task       : Task_designator;
  Temp_user_node : Pool_user_list.List_node;
  The_user_node  : Pool_user_list.List_node;
  Temp_user_val  : Pool_user_rec;
  The_user_val   : Pool_user_rec;
  
  begin
    The_user_node := Valid_user (The_user => The_user);
    if The_user_node = Pool_user_list.Empty_node then
      raise Invalid_pool_user_id;
    elsif Deadlock_checking = FALSE then
      The_task := Task_designator (The_pool.Request_task);
      Add_new_task (Rtask => The_task, User => The_user);
      return The_task;
    else
      The_user_val := Pool_user_list.Value (From_node => The_user_node);
      The_pool.No_wait_request_task (The_task   => 
                                       The_pool.Task_designator (The_task),
                                     Valid_task => Valid_task);
      if not Valid_task then                               
        if The_user_val.Tasks_owned > 0 then               
          Temp_user_node := Pool_user_list.Travel_node (From_node => 
                                                          The_user_list);
          loop
            exit when Temp_user_node = The_user_list;
            if Temp_user_node /= The_user_node then
              Temp_user_val := Pool_user_list.Value (From_node => 
                                                       Temp_user_node);
              if (Temp_user_val.Tasks_owned > 0) and 
                 (Temp_user_val.Tasks_wanted = 0) then exit; 
              end if;
            end if;
            Temp_user_node := Pool_user_list.Travel_node (From_node => 
                                                            Temp_user_node);
          end loop;
          if Temp_user_node = The_user_list then
            raise Deadlock_prone_task_request;
          end if;
        end if;
        The_user_val.Tasks_wanted := The_user_val.Tasks_wanted + 1;
        Pool_user_list.Update_node (The_node  => The_user_node,
                                    New_value => The_user_val);
        The_task := Task_designator (The_pool.Request_task);
        The_user_val.Tasks_wanted := The_user_val.Tasks_wanted - 1;
      end if;
      Add_new_task (Rtask => The_task, User => The_user);
      The_user_val.Tasks_owned := The_user_val.Tasks_owned + 1;
      Pool_user_list.Update_node (The_node  => The_user_node,
                                  New_value => The_user_val);
      return The_task;
    end if;
  end Request_task;
    
    
  Procedure No_wait_request_task (The_user   : in     Pool_user_id;
                                  The_task   :    out Task_designator;
                                  Valid_task :    out BOOLEAN) is
                                  
  Local_task    : Task_designator;
  The_user_node : Pool_user_list.List_node;
  The_user_val  : Pool_user_rec;
  Task_acquired : BOOLEAN;
                                  
  begin
    The_user_node := Valid_user (The_user => The_user);
    if The_user_node = Pool_user_list.Empty_node then
      raise Invalid_pool_user_id;
    else
      The_pool.No_wait_request_task (The_task   => 
                                       The_pool.Task_designator (Local_task),
                                     Valid_task => Task_acquired);
      if Task_acquired then
        Valid_task := TRUE;
        The_task := Local_task;
        Add_new_task (Rtask => Local_task, User => The_user);
        if Deadlock_checking then
          The_user_val := Pool_user_list.Value (From_node => The_user_node);
          The_user_val.Tasks_owned := The_user_val.Tasks_owned + 1;
          Pool_user_list.Update_node (The_node  => The_user_node,
                                      New_value => The_user_val);
        end if;
      else
        Valid_task := FALSE;
      end if;
    end if;    
  end No_wait_request_task;   
    
 
  Function  Request_task         (The_user   : in     Pool_user_id;
                                  Time_limit : in     DURATION)
                                               return Task_designator is
  
  The_task: Task_designator;
  
  begin
    if not (Timed_requests) then
      raise No_timed_task_requests;
    else
      The_task := Request_task (The_user => The_user);
      
      
      Task_timer.Schedule_one_shot_wakeup (The_wakeup => 
                                             (User  => The_user,
                                              Rtask => The_task),
                                           Signal_time =>
                                             (CLOCK + Time_limit));
      return The_task;
    end if;
  end Request_task;
 

  Procedure No_wait_request_task (The_user   : in     Pool_user_id;
                                  The_task   :    out Task_designator;
                                  Time_limit : in     DURATION;
                                  Valid_task :    out BOOLEAN) is
                                  
  Task_acquired : BOOLEAN;
  Local_task    : Task_designator;
                                  
  begin
    if not (Timed_requests) then
      raise No_timed_task_requests;
    else
      No_wait_request_task (The_user   => The_user,
                            The_task   => Local_task,
                            Valid_task => Task_acquired);
      
      
      if Task_acquired then
        Valid_task := TRUE;
        The_task := Local_task;
        Task_timer.Schedule_one_shot_wakeup (The_wakeup => 
                                               (User  => The_user,
                                                Rtask => Local_task),
                                             Signal_time =>
                                               (CLOCK + Time_limit));
      end if;
    end if;
  end No_wait_request_task;
      

  Procedure Change_time_limit    (The_user   : in     Pool_user_id;
                                  The_task   : in     Task_designator;
                                  Time_limit : in     DURATION) is
                                  
  Task_index: NATURAL;
  
  begin
    if not (Timed_requests) then
      raise No_timed_task_requests;
    elsif Valid_user (The_user => The_user) = Pool_user_list.Empty_node then
      raise Invalid_pool_user_id;
    else
      Task_index := Valid_task_index (The_task => The_task);
      if Task_index = 0 then
        raise Invalid_task_id;
      elsif Task_master (Task_index).User /= The_user then
        raise Invalid_task_id;
      else
        begin
          Task_timer.Unschedule_wakeup (The_wakeup =>
                                          (User  => The_user,
                                           Rtask => The_task));
          exception  
            when Task_timer.Invalid_wakeup_designator => null;
        end;
        Task_timer.Schedule_one_shot_wakeup (The_wakeup => 
                                               (User  => The_user,
                                                Rtask => The_task),
                                             Signal_time =>
                                               (CLOCK + Time_limit));
      end if;
    end if;
  end Change_time_limit;        
 

  Procedure Release_task         (The_user   : in     Pool_user_id;
                                  The_task   : in     Task_designator) is
  
  Task_index   : NATURAL;
  The_user_node: Pool_user_list.List_node;
  The_user_val : Pool_user_rec;
  
  begin
    The_user_node := Valid_user (The_user => The_user);
    if The_user_node = Pool_user_list.Empty_node then
      raise Invalid_pool_user_id;
    else
      Task_index := Valid_task_index (The_task => The_task);
      if Task_index = 0 then
        raise Invalid_task_id;
      elsif (Bandit_checking and       
               Task_master (Task_index).User /= The_user) then
        raise Invalid_task_id;
      else
        The_pool.Release_task (The_task => The_pool.Task_designator (The_task));
        if Deadlock_checking then
          if Task_master (Task_index).User /= The_user then
            The_user_node := Valid_user (The_user =>  
                                          Task_master (Task_index).User);
          end if;
          The_user_val := Pool_user_list.Value (From_node => The_user_node);
          The_user_val.Tasks_owned := The_user_val.Tasks_owned - 1;
          Pool_user_list.Update_node (The_node  => The_user_node,
                                      New_value => The_user_val);
        end if;
        Remove_task (Task_index);
      end if;
    end if;
  end Release_task;
  
begin
  Pool_user_list.Initialize_list (New_list => The_user_list);
end Reliable_task_pool;
 
'
]

{ #category : #'addit. arts' }
AdaTestSample class >> rtskpoolAds [
	
	^'  with CALENDAR; use CALENDAR;
with Task_pool; 
generic
  type Task_type is limited private;
  Static_size   : NATURAL := 0;
  Dynamic_limit : NATURAL := 0;
  Bandit_checking,
  Deadlock_checking,
  Timed_requests: BOOLEAN := TRUE; 
 
Package Reliable_task_pool is
  
  Package   The_pool is new Task_pool     (Task_type     => Task_type,
                                           Static_size   => Static_size,
                                           Dynamic_limit => Dynamic_limit); 
 
  type Pool_user_id is private;
  type Task_designator is new The_pool.Task_designator; 
 
  Function  New_pool_user return Pool_user_id; 
  
  Procedure Release_pool_user    (The_user   : in     Pool_user_id); 
 
  Function  Request_task         (The_user   : in     Pool_user_id)
                                               return Task_designator;
 
  Procedure No_wait_request_task (The_user   : in     Pool_user_id;
                                  The_task   :    out Task_designator;
                                  Valid_task :    out BOOLEAN);
 
  Function  Request_task         (The_user   : in     Pool_user_id;
                                  Time_limit : in     DURATION)
                                               return Task_designator;
 
  Procedure No_wait_request_task (The_user   : in     Pool_user_id;
                                  The_task   :    out Task_designator;
                                  Time_limit : in     DURATION;
                                  Valid_task :    out BOOLEAN);
 
  Procedure Change_time_limit    (The_user   : in     Pool_user_id;
                                  The_task   : in     Task_designator;
                                  Time_limit : in     DURATION);
 
  Procedure Release_task         (The_user   : in     Pool_user_id;
                                  The_task   : in     Task_designator);
 
  Deadlock_prone_task_request,
  Invalid_task_id,
  Invalid_pool_user_id,
  No_timed_task_requests  : exception;
  
  private
    type Pool_user_id is new TIME; 
 
end Reliable_task_pool;
 
'
]

{ #category : #'addit. gps' }
AdaTestSample class >> screenOutput [
	
	^'with Ada.Text_IO; use Ada.Text_IO;
with Input;
-- comment
package body Screen_Output is

   Debug_On : constant Boolean := False;

   procedure Msg
     (S1       : String;
      S2       : String  := "";
      End_Line : Boolean := True)
   is
   begin
      Put (S1);
      Put (S2);
      if End_Line then
         New_Line;
      end if;
   end Msg;

   procedure Debug_Msg (S : String) is
   begin
      if not Debug_On then
         return;
      end if;

      Put ("DEBUG: ");
      Put (S);
      New_Line;
   end Debug_Msg;

   procedure Error_Msg (S1 : String; S2 : String := ""; S3 : String := "") is
   begin
      Put ("sdc error at line");
      Put (NaturalImage (Input.Line_Number) & ": ");
      Put (S1);
      Put (S2);
      Put (S3);
      New_Line;
   end Error_Msg;

   procedure Syntax_Error (S : String; Error_Pos : Natural := 0) is
      Pos : Natural := Error_Pos;

   begin
      if Pos = 0 then
         Pos := Input.Column_Number;
      end if;

      Put ("sdc:");
      Put_Line (Input.Current_Line);

      Put ("sdc:");
      for I in 1 .. Pos - 1 loop
         Put ("-");
      end loop;

      Put_Line ("!");
      Put ("sdc input error at line");
      Put (NaturalImage (Input.Line_Number) & ": " & S);
      New_Line;
   end Syntax_Error;

   procedure Pause is
   begin
      Put ("Press a key to continue...");
      Skip_Line;
   end Pause;

end Screen_Output;'
]

{ #category : #'addit. webexamples' }
AdaTestSample class >> simpleLinkedList [
	"from http://sandbox.mc.edu/~bennet/ada/examples/ll_adb.html"
	
	^'with Gnat.Io; use Gnat.Io;
procedure ll is
   type Node;
   type Node_Ptr is access Node;

   type Node is record
      Data: Integer;
      Next: Node_Ptr;
   end record;

   Head: Node_Ptr;
   New_Node: Node_Ptr;
   Scan_Ptr: Node_Ptr;
   In_Int: Integer;
begin
   loop
      Put("> ");
      Get(In_Int);
      exit when In_Int = -1;

      New_Node := new Node''(In_Int, null);

      New_Node.Next := Head;
      Head := New_Node;

   end loop;

   Scan_Ptr := Head;
   loop
      exit when Scan_Ptr = null;

      Put(Scan_Ptr.Data);
      Scan_Ptr := Scan_Ptr.Next;

      exit when Scan_Ptr = null;

      Put(" ");
   end loop;

   New_Line;
end ll;'
]

{ #category : #'addit. webexamples' }
AdaTestSample class >> skipAndRead2 [
	"from http://sandbox.mc.edu/~bennet/ada/examples/readrest2_adb.html"
	
	^'
with Gnat.Io; use Gnat.Io;
procedure ReadRest2 is
   procedure ReadStr(Str: out String; Last: out Integer) is
      I: Integer;
      Ch: Character;
   begin
      loop
         Get(Ch);
         exit;
      end loop;
      Str(Str''first) := Ch;

      Get_Line(Str(Str''First+1..Str''last), Last);

   end ReadStr;

   Max: constant := 20;
   Fred: String(1..Max);
   I: Integer;
begin
   ReadStr(Fred, I);

   Put_Line(Fred(1..I));
end ReadRest2;'
]

{ #category : #'addit. arts' }
AdaTestSample class >> taskpoolAds [
	
	^'generic
  type Task_type is limited private;
  Static_size   : NATURAL := 0;
  Dynamic_limit : NATURAL := 0;

package Task_pool is

  type Task_designator is access Task_type;

  Function Request_task           return Task_designator;

  Procedure No_wait_request_task (The_task   : out Task_designator;
                                  Valid_task : out BOOLEAN);

  Procedure Release_task         (The_task : in Task_designator);

  Invalid_task_designator  : exception;

end Task_pool;


'
]

{ #category : #'addit. arts' }
AdaTestSample class >> timedbufAdb [
	
	^'with Wakeup_scheduling;
with CALENDAR; use CALENDAR;
Package body Timed_buffer is


  Task Buffer is
    entry Put_in_buffer            (In_data : in Element);
    entry Buffer_timedout;
    entry Set_buffer_timeout       (Timeout : in DURATION);
    entry Flush_buffer;
    entry Stop_buffer_timer;
  end Buffer;

  Procedure Timer_expiration (Which_wakeup : in INTEGER);

  Package Timer is new Wakeup_scheduling (Wakeup_designator => INTEGER,
                                          Signal            =>
                                                      Timer_expiration);

  Procedure Put_in_buffer (In_data : in Element) is
  begin 
    Buffer.Put_in_buffer (In_data => In_data);
  end Put_in_buffer;

  Procedure Set_buffer_timeout (Timeout : in DURATION) is
  begin 
    Buffer.Set_buffer_timeout (Timeout => Timeout);
  end Set_buffer_timeout;

  Procedure Flush_buffer is
  begin 
    Buffer.Flush_buffer;
  end Flush_buffer;

  Procedure Abort_buffer is
  begin 
    Buffer.Stop_buffer_timer;
  end Abort_buffer;

  Procedure Flush_and_abort_buffer is
  begin 
    Buffer.Stop_buffer_timer;
    Buffer.Flush_buffer;
  end Flush_and_abort_buffer;

  Procedure Timer_expiration (Which_wakeup : in INTEGER) is
  begin 
    Buffer.Buffer_timedout;
  end Timer_expiration;


  Task body Buffer is

    The_buffer     : array (1..Buffer_multiplicity) of Buffer_load;
    Buffer_count   : NATURAL  := 0;
    Current_buffer : POSITIVE := 1;
    Buffer_limit   : INTEGER;
    Timer_wakeup   : INTEGER  := 1;
    Signal_time    : TIME;

    Task type Send_task is
      entry Do_send (Send_count  : in NATURAL;
                     Send_buffer : in Buffer_load);
    end Send_task;

    Task body Send_task is
      The_count  : NATURAL;
      The_buffer : Buffer_load;
    begin 
      select
        accept Do_send (Send_count  : in NATURAL;
                        Send_buffer : in Buffer_load) do
          The_count  := Send_count;   
          The_buffer := Send_buffer;  
          end Do_send;  
        Send (Valid_elements => The_count,
              The_load       => The_buffer);
        or terminate;
      end select;
    exception
      when TASKING_ERROR => null;
    end Send_task;

    Procedure Send_buffer (The_send_count  : in NATURAL;
                           The_send_buffer : in POSITIVE) is
      type Send_task_ptr is access Send_task;
      The_send_task : Send_task_ptr;
    begin 
      The_send_task := new Send_task;
      The_send_task.Do_send (Send_count  => The_send_count,
                             Send_buffer =>
                                        The_buffer (The_send_buffer));
    end Send_buffer;

    Procedure Swap_and_send_buffer (The_send_buffer : in POSITIVE;
                                    The_send_count  : in NATURAL) is
    begin 
      if Buffer_multiplicity > 1 then
        Current_buffer := Current_buffer + 1;
        if Current_buffer > Buffer_multiplicity then
          Current_buffer := 1;
        end if;
        Buffer_count := 0;
        Send_buffer (The_send_count  => The_send_count,
                     The_send_buffer => The_send_buffer);
      else    
        Send (Valid_elements => The_send_count,
              The_load       => The_buffer (The_send_buffer));
        Buffer_count := 0;
      end if;
    exception
      when TASKING_ERROR => null;
    end Swap_and_send_buffer;

    Procedure Do_put_in_buffer (The_element  : in Element) is
      Send_buffer : POSITIVE;
      Send_count  : NATURAL;
    begin 
      Buffer_count := Buffer_count + 1;
      The_buffer (Current_buffer) (Buffer_size''VAL (Buffer_count)) :=
                                                                The_element;
      if Buffer_count = Buffer_limit then
        Send_buffer := Current_buffer;
        Send_count  := Buffer_count;
        Swap_and_send_buffer (The_send_buffer => Send_buffer,
                              The_send_count  => Send_count);
      end if;
    end Do_put_in_buffer;

  begin  

    Buffer_limit := Buffer_size''POS (Buffer_size''LAST) -
                                 Buffer_size''POS (Buffer_size''FIRST) + 1;
    Signal_time := CLOCK + Buffer_timeout;
    Timer.Schedule_periodic_wakeup (The_wakeup    => Timer_wakeup,
                                    Signal_time   => Signal_time,
                                    Wakeup_period => Buffer_timeout);
    loop
      select
        accept Put_in_buffer (In_data : in Element) do
          Do_put_in_buffer (The_element  => In_data);
          end Put_in_buffer;                

        or accept Buffer_timedout do
          Swap_and_send_buffer (The_send_buffer => Current_buffer,
                                The_send_count  => Buffer_count);
          end Buffer_timedout;                

        or accept Set_buffer_timeout (Timeout : in DURATION) do
          Timer.Unschedule_wakeup (The_wakeup => Timer_wakeup);
          Signal_time := CLOCK + Timeout;
          Timer.Schedule_periodic_wakeup (The_wakeup    => Timer_wakeup,
                                          Signal_time   => Signal_time,
                                          Wakeup_period => Timeout);
          end Set_buffer_timeout;            

        or accept Flush_buffer do
          Swap_and_send_buffer (The_send_buffer => Current_buffer,
                                The_send_count  => Buffer_count);
          end Flush_buffer;            

        or accept Stop_buffer_timer do
           Timer.Unschedule_wakeup (The_wakeup => Timer_wakeup);
         end Stop_buffer_timer;            

        or terminate;    
      end select;
    end loop;

  end Buffer;

begin 
  null;
end Timed_buffer;

'
]

{ #category : #'addit. arts' }
AdaTestSample class >> timedbufAds [
	
	^'generic type Element is private;
    type Buffer_size is <>;
    type Buffer_load is array (Buffer_size) of Element;
    with Procedure Send (Valid_elements : in NATURAL;
                         The_load       : in Buffer_load);
    Buffer_timeout      : in DURATION := 1.0; 
    Buffer_multiplicity : in POSITIVE := 1;

Package Timed_buffer is

  Procedure Put_in_buffer      (In_data : in Element);

  Procedure Set_buffer_timeout (Timeout : in DURATION);

  Procedure Flush_buffer;

  Procedure Abort_buffer;

  Procedure Flush_and_abort_buffer;

end Timed_buffer;


'
]

{ #category : #'addit. arts' }
AdaTestSample class >> wkupskedAdb [
	
	^'with Linked_List;
with Lock_manager;
with UNCHECKED_CONVERSION;
with CALENDAR; use CALENDAR;

Package body Wakeup_scheduling is

  Dummy_wakeup : Wakeup_designator;

  Schedule_Lock : Lock_manager.Lock_id;

  type Wait_task;

  type Wait_access is access Wait_task;

  type Wakeup_record is record
                        The_wakeup    : Wakeup_designator;
                        The_wait_task : Wait_access;
                        Signal_time   : TIME;
                        Wakeup_period : DURATION;
                        Time_offset   : DURATION;
                        Miss_option   : Missed_execution_option;
                      end record;

  task type Wait_task is
    entry Wait (The_wakeup : in Wakeup_record);
  end Wait_task;

  Illegal_record : Wakeup_record := (The_wakeup    => Dummy_wakeup,
                                     The_wait_task => null,
                                     Signal_time   => TIME_OF (YEAR => 1901,
                                                          MONTH     => 1,
                                                          DAY       => 1,
                                                          SECONDS   => 0.0),
                                     Wakeup_period => 0.0,
                                     Time_offset   => 0.0,
                                     Miss_option   => Signal_earliest);

  Package Wakeup_record_list is new Linked_List (ITEM_TO_MANAGE =>
                                                          Wakeup_record,
                                                 Illegal_Value  =>
                                                          Illegal_record);

  use Wakeup_record_list;       


  Task Schedule_listener is
    entry Timer_expired (The_wakeup : in Wakeup_record);
  end Schedule_listener;

  The_schedule_list : Wakeup_record_list.List_Node;

  Procedure Schedule_periodic_wakeup (The_wakeup    : in Wakeup_designator;
                                      Signal_time   : in CALENDAR.TIME;
                                      Wakeup_period : in DURATION;
                                      Miss_option   :
                                           in Missed_execution_option
                                                    := Signal_earliest;
                                      Miss_delta    : in DURATION
                                                    := Default_miss_delta) is
    The_wait_task     : Wait_access;
    The_wakeup_record : Wakeup_record;
    Dummy_record_node : Wakeup_record_list.List_Node;
  begin 
    The_wakeup_record.The_wakeup    := The_wakeup;
    The_wakeup_record.Signal_time   := Signal_time;
    The_wakeup_record.Wakeup_period := Wakeup_period;
    The_wakeup_record.Time_offset   := Miss_delta;
    The_wakeup_record.Miss_option   := Miss_option;
    The_wait_task                   := new Wait_task;
    The_wakeup_record.The_wait_task := The_wait_task;
    if Lock_manager.Wait_request_lock (The_lock     => Schedule_lock,
                                       Request_type =>
                                                Lock_manager.Exclusive) then
      Wakeup_record_list.Append_Node (To_List   => The_schedule_list,
                                      New_Value => The_wakeup_record,
                                      New_Node  => Dummy_record_node);
      Lock_manager.Release_lock (The_lock  => Schedule_lock);
      The_wait_task.Wait (The_wakeup => The_wakeup_record);
    end if;
  end Schedule_periodic_wakeup;

  Procedure Schedule_one_shot_wakeup (The_wakeup  : in Wakeup_designator;
                                      Signal_time : in CALENDAR.TIME;
                                      Miss_option :
                                        in Missed_execution_option
                                                    := Signal_earliest;
                                      Miss_delta  : in DURATION
                                                    := Default_miss_delta) is
    The_wait_task     : Wait_access;
    The_wakeup_record : Wakeup_record;
    Dummy_record_node : Wakeup_record_list.List_Node;
  begin 
    The_wakeup_record.The_wakeup    := The_wakeup;
    The_wakeup_record.Signal_time   := Signal_time;
    The_wakeup_record.Wakeup_period := 0.0;
    The_wakeup_record.Time_offset   := Miss_delta;
    The_wakeup_record.Miss_option   := Miss_option;
    The_wait_task                   := new Wait_task;
    The_wakeup_record.The_wait_task := The_wait_task;
    if Lock_manager.Wait_request_lock (The_lock     => Schedule_lock,
                                       Request_type =>
                                                Lock_manager.Exclusive) then
      Wakeup_record_list.Append_Node (To_List   => The_schedule_list,
                                      New_Value => The_wakeup_record,
                                      New_Node  => Dummy_record_node);
      Lock_manager.Release_lock (The_lock  => Schedule_lock);
      The_wait_task.Wait (The_wakeup => The_wakeup_record);
    end if;
  end Schedule_one_shot_wakeup;

  Procedure Signal_periodic_wakeup   (The_wakeup    : in Wakeup_designator;
                                      Wakeup_period : in DURATION;
                                      Miss_option   :
                                        in Missed_execution_option
                                                        := Signal_earliest;
                                      Miss_delta    : in DURATION
                                                        := Default_miss_delta) is
    Wakeup_signal_time : TIME;
  begin 
    Wakeup_signal_time  := CLOCK + Wakeup_period;
    Schedule_periodic_wakeup (The_wakeup    => The_wakeup,
                              Signal_time   => Wakeup_signal_time,
                              Wakeup_period => Wakeup_period,
                              Miss_option   => Miss_option,
                              Miss_delta    => Miss_delta);
    Signal (Which_wakeup => The_wakeup);
  exception
    when TASKING_ERROR => null;
  end Signal_periodic_wakeup;

  Function Find_wakeup (The_wakeup : in Wakeup_designator)
                                       return Wakeup_record_list.List_Node is
    First_wakeup_node,
    This_node         : Wakeup_record_list.List_Node;
    The_wakeup_record : Wakeup_record;
  begin 
    First_wakeup_node := Wakeup_record_list.Find_First_Node (Inside_List =>
                                                        The_schedule_list);
    This_node := First_wakeup_node;
    if This_node /= Wakeup_record_list.Empty_Node then
      loop
        The_wakeup_record := Wakeup_record_list.Value (This_node);
        if The_wakeup_record.The_wakeup = The_wakeup then
          if the_wakeup_record /= Illegal_record then
            exit;
          end if;
        end if;
        This_node := Find_Next_Node (Current_Node => This_Node);
        exit when This_node = Wakeup_record_list.Empty_Node;
        if This_node = First_wakeup_node then
          This_node := Wakeup_record_list.Empty_Node;
          exit;
        end if;
      end loop;
    end if;
    return This_node;
  end Find_wakeup;

  Procedure Unschedule_wakeup (The_wakeup : in Wakeup_designator) is
    The_wakeup_node   : Wakeup_record_list.List_Node;
    The_wakeup_record : Wakeup_record;
  begin 
    if Lock_manager.Wait_request_lock (The_lock     => Schedule_lock,
                                       Request_type =>
                                                Lock_manager.Exclusive) then
      The_wakeup_node := Find_wakeup (The_wakeup => The_wakeup);
      if The_wakeup_node /= Wakeup_record_list.Empty_Node then
        The_wakeup_record := Wakeup_record_list.Value (The_wakeup_node);
        if The_wakeup_record.The_wait_task /= null then
          if not The_wakeup_record.The_wait_task''TERMINATED then
            abort The_wakeup_record.The_wait_task.ALL;
          end if;
        end if;
        Wakeup_record_list.Delete_Node (The_Node => The_wakeup_node);
        Lock_manager.Release_lock (The_lock => Schedule_lock);
      else
        Lock_manager.Release_lock (The_lock => Schedule_lock);
        raise Invalid_wakeup_designator;
      end if;
    end if;
  end Unschedule_wakeup;

  Procedure Set_miss_option (The_wakeup  : in Wakeup_designator;
                             Miss_option : in Missed_execution_option) is
    The_wakeup_node   : Wakeup_record_list.List_Node;
    The_wakeup_record : Wakeup_record;
  begin 
    if Lock_manager.Wait_request_lock (The_lock     => Schedule_lock,
                                       Request_type =>
                                                Lock_manager.Exclusive) then
      The_wakeup_node := Find_wakeup (The_wakeup => The_wakeup);
      if The_wakeup_node /= Wakeup_record_list.Empty_Node then
        The_wakeup_record := Wakeup_record_list.Value (The_wakeup_node);
        The_wakeup_record.Miss_option := Miss_option;
        Wakeup_record_list.Update_Node (The_Node  => The_wakeup_node,
                                        New_Value => The_wakeup_record);
        Lock_manager.Release_lock (The_lock => Schedule_lock);
      else  
        Lock_manager.Release_lock (The_lock => Schedule_lock);
        raise Invalid_wakeup_designator;
      end if;
    end if;
  end Set_miss_option;

  Procedure Set_miss_delta          (The_wakeup    : in Wakeup_designator;
                                     Miss_delta    : in DURATION
                                                        := Default_miss_delta) is
    The_wakeup_node   : Wakeup_record_list.List_Node;
    The_wakeup_record : Wakeup_record;
  begin 
    if Lock_manager.Wait_request_lock (The_lock     => Schedule_lock,
                                       Request_type =>
                                                Lock_manager.Exclusive) then
      The_wakeup_node := Find_wakeup (The_wakeup => The_wakeup);
      if The_wakeup_node /= Wakeup_record_list.Empty_Node then
        The_wakeup_record := Wakeup_record_list.Value (The_wakeup_node);
        The_wakeup_record.Time_offset := Miss_delta;
        Wakeup_record_list.Update_Node (The_Node  => The_wakeup_node,
                                        New_Value => The_wakeup_record);
        Lock_manager.Release_lock (The_lock => Schedule_lock);
      else  
        Lock_manager.Release_lock (The_lock => Schedule_lock);
        raise Invalid_wakeup_designator;
      end if;
    end if;
  end Set_miss_delta;

Task body Schedule_listener is
    The_wait_task       : Wait_access;
    The_wakeup_node     : Wakeup_record_list.List_Node;
    Saved_wakeup_record : Wakeup_record;
    Delay_time          : DURATION;
    Now                 : TIME;
  begin  
    loop
      select
        accept Timer_expired (The_wakeup : in Wakeup_record) do
          Saved_wakeup_record := The_wakeup;
        end Timer_expired;
        if Lock_manager.Wait_request_lock (The_lock     => Schedule_lock,
                                           Request_type =>
                                                Lock_manager.Exclusive) then
          The_wakeup_node := Wakeup_record_list.Find_Node (Inside_List =>
                                                          The_schedule_list,
                                                           Old_Value   =>
                                                          Saved_wakeup_record);
          if The_wakeup_node /= Wakeup_record_list.Empty_Node then
            Now := CLOCK;
            Delay_time := Saved_wakeup_record.Signal_time - Now;
            if Delay_time > 0.0 then
              Delay (Delay_time);
              Signal (Which_wakeup => Saved_wakeup_record.The_wakeup);
            elsif Saved_wakeup_record.Miss_option = Signal_Earliest then
              Signal (Which_wakeup => Saved_wakeup_record.The_wakeup);
            else  
              if (Now - Saved_wakeup_record.Signal_time) <=
                                    Saved_wakeup_record.Time_offset then
                Signal (Which_wakeup => Saved_wakeup_record.The_wakeup);
              end if;
            end if;
            if Saved_wakeup_record.Wakeup_period /= 0.0 then
              The_wait_task := new Wait_task;
              Saved_wakeup_record.The_wait_task := The_wait_task;
              Saved_wakeup_record.Signal_time := Saved_wakeup_record.Signal_time +
                                               Saved_wakeup_record.Wakeup_period;
              Wakeup_record_list.Update_Node (The_Node   => The_wakeup_node,
                                              New_value => Saved_wakeup_record);
              The_wait_task.Wait (The_wakeup => Saved_wakeup_record);
            else  
              Wakeup_record_list.Delete_Node (The_wakeup_node);
            end if;
          end if;
          Lock_manager.Release_lock (The_lock => Schedule_lock);
        end if;

        or terminate;    
      end select;
    end loop;
  exception
    when TASKING_ERROR => null;
  end Schedule_listener;

  Task body Wait_task is
    Saved_wakeup_record : Wakeup_record;
  begin  
    accept Wait (The_wakeup : in Wakeup_record) do
      Saved_wakeup_record := The_wakeup;
    end Wait;
    Delay (Saved_wakeup_record.Signal_time - CLOCK -
              Saved_wakeup_record.Time_offset);
    if Schedule_listener''CALLABLE = TRUE then
      Schedule_listener.Timer_expired (Saved_wakeup_record);
    end if;
  end Wait_task;

begin 
  Wakeup_record_list.Initialize_List (New_list => The_schedule_list);
  Schedule_lock := Lock_manager.New_lock_tree;
end Wakeup_scheduling;


'
]

{ #category : #'addit. arts' }
AdaTestSample class >> wkupskedAds [
	
	^'with CALENDAR;

generic type Wakeup_designator is private;
        Default_miss_delta : DURATION := 1.0;   
        with Procedure Signal (Which_wakeup : in Wakeup_designator);

Package Wakeup_scheduling is

  type Missed_execution_option is (Signal_earliest, Skip_cycle);

  Procedure Schedule_periodic_wakeup (The_wakeup    : in Wakeup_designator;
                                      Signal_time   : in CALENDAR.TIME;
                                      Wakeup_period : in DURATION;
                                      Miss_option   :
                                           in Missed_execution_option
                                                    := Signal_earliest;
                                      Miss_delta    : in DURATION
                                                    := Default_miss_delta);

  Procedure Schedule_one_shot_wakeup (The_wakeup  : in Wakeup_designator;
                                      Signal_time : in CALENDAR.TIME;
                                      Miss_option :
                                        in Missed_execution_option
                                                    := Signal_earliest;
                                      Miss_delta  : in DURATION
                                                    := Default_miss_delta);

  Procedure Signal_periodic_wakeup   (The_wakeup    : in Wakeup_designator;
                                      Wakeup_period : in DURATION;
                                      Miss_option   :
                                        in Missed_execution_option
                                                        := Signal_earliest;
                                      Miss_delta    : in DURATION
                                                        := Default_miss_delta);

  Procedure Unschedule_wakeup        (The_wakeup : in Wakeup_designator);

  Procedure Set_miss_option          (The_wakeup    : in Wakeup_designator;
                                      Miss_option :
                                          in Missed_execution_option);

  Procedure Set_miss_delta          (The_wakeup    : in Wakeup_designator;
                                     Miss_delta    : in DURATION
                                                        := Default_miss_delta);

  Invalid_wakeup_designator  : exception;

end Wakeup_scheduling;

'
]
