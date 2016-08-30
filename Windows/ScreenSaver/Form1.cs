using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace ScreenProtect
{
    public partial class Form1 : Form
    {
        private Font font = new Font("Bold", 10);
        private Brush brush = new SolidBrush(Color.Green);
        private int count = 0;

        private Graphics g;

        private static Random random = new Random();
        private static int width = 128;
        private static int height = 72;
        private static int flips = 5;
        private static String garbage = "1234567890!@#$%^&*()ZXCVBNM<>?";

        private int[] switches = new int[width];

        public Form1()
        {
            InitializeComponent();
            g = this.CreateGraphics();
            for (int i = 0; i < width; i++)
            {
                switches[i] = 1;
            }
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            for (int i = 0; i < flips; i++)
            {
                int x = random.Next(width - 1);
                if (switches[x] == 0)
                {
                    switches[x] = 1;
                }
                else {
                    switches[x] = 0;
                }
            }

            for (int i = 0; i < width; i++)
            {
                PointF p = new PointF(i * 15 + 10, count * 15 + 10);
                if (switches[i] == 1)
                {
                    int x = random.Next(garbage.Length - 1);
                    g.DrawString(garbage.Substring(x, 1), font, brush, p);
                }
                else {
                    g.DrawString(" ", font, brush, p);
                }
            }

            count += 1;

            if (count == height)
            {
                this.Invalidate();
                count = 0;
            }

        }

        private void Form1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void Form1_MouseCaptureChanged(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void Form1_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Escape)
                Application.Exit();
        }
    }
}