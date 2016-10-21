#include<GL/glut.h>
void myFunc(void);
void myInit(void);
void mySize(GLsizei,GLsizei);
int main(int argc, char* argv[])    
{    
    glutInit(&argc, argv);    
    glutInitDisplayMode(GLUT_RGBA | GLUT_SINGLE);
	glutInitWindowSize(640,480);
    glutCreateWindow("640x480");    
    glutDisplayFunc(myFunc);
	glutReshapeFunc(mySize);
	myInit();
    glutMainLoop();    
    return 0;    
} 
void myFunc(void)
{
	glClear(GL_COLOR_BUFFER_BIT);
	//glRectf(-25.0f,25.0f,25.0f,-25.0f);
	glShadeModel(GL_SMOOTH);
	glBegin(GL_TRIANGLES);
		glColor3ub((GLubyte)255,(GLubyte)0,(GLubyte)0);
		glVertex2f(0,0);
		glColor3ub((GLubyte)0,(GLubyte)255,(GLubyte)0);
		glVertex2f(639,0);
		glColor3ub((GLubyte)0,(GLubyte)0,(GLubyte)255);
		glVertex2f(0,479);
		//
		//
		glColor3ub((GLubyte)0,(GLubyte)255,(GLubyte)0);
		glVertex2f(639,0);
		glColor3ub((GLubyte)255,(GLubyte)0,(GLubyte)0);
		glVertex2f(639,479);
		glColor3ub((GLubyte)0,(GLubyte)0,(GLubyte)255);
		glVertex2f(0,479);
	glEnd();
	glFlush();
}
void myInit(void)
{
	glClearColor(0.0f,0.0f,0.0f,1.0f);
	//glColor3f(1.0f,0.0f,0.0f);
}
void mySize(GLsizei w,GLsizei h)
{
	//printf("w=%d\th=%d\n",w,h);
	glViewport(0,0,w,h);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluOrtho2D(0,w-1,h-1,0);
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
}
