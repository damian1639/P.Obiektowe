using System;
using System.Collections.Generic;
using System.IO.Pipes;
using System.Security.Cryptography.X509Certificates;
using System.Windows.Forms;

namespace isi1_2
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            {
                var w1 = new Węzeł(5);
                var w2 = new Węzeł(3);
                var w3 = new Węzeł(1);
                var w4 = new Węzeł(2);
                var w5 = new Węzeł(6);
                var w6 = new Węzeł(4);
                w1.dzieci.Add(w2);
                w1.dzieci.Add(w3);
                w1.dzieci.Add(w4);
                w2.dzieci.Add(w5);
                w2.dzieci.Add(w6);

                var p1 = new Węzeł2(1);
                var p2 = new Węzeł2(2);
                var p3 = new Węzeł2(3);
                var p4 = new Węzeł2(4);
                var p5 = new Węzeł2(5);
                var p6 = new Węzeł2(6);

                p1.Add(p2);
                p1.Add(p3);
                p2.Add(p4);
                p2.Add(p5);
                p3.Add(p6);
                p4.Add(p6);
                //B(p1);
                //MessageBox.Show(napis);


                var d = new DrzewoBinarne(5);
                d.Add(4);
                d.Add(4);
                d.Add(8);
                d.Add(7);
                d.Add(9);
                d.Add(6);



            }

            void A(Węzeł w)
            {
                MessageBox.Show(w.wartość.ToString());
                for (int i = 0; i < w.dzieci.Count; i++)
                {
                    A(w.dzieci[i]);
                }
            }

            // DFS GRAF z cyklami
            string napis = "";
            List<Węzeł2> odwiedzone = new();

            void B(Węzeł2 w)
            {
                odwiedzone.Add(w);
                napis += w.wartość.ToString();
                foreach (var sąsiad in w.sąsiad)
                {
                    if (!odwiedzone.Contains(sąsiad))
                    {
                        B(sąsiad);
                    }
                }
            }
        }
    }
    public class Węzeł
    {
        public int wartość;
        public List<Węzeł> dzieci = new List<Węzeł>();
        public Węzeł(int liczba)
        {
            this.wartość = liczba;
        }
    }
    public class Węzeł2
    {
        public int wartość;
        public List<Węzeł2> sąsiad = new List<Węzeł2>();

        public Węzeł2(int liczba)
        {
            this.wartość = liczba;
        }
        public void Add(Węzeł2 s)
        {
            if (s == this)
            {
                return;
            }
            if (!this.sąsiad.Contains(s))
            {
                this.sąsiad.Add(s);
                s.sąsiad.Add(this);
            }
            if (!s.sąsiad.Contains(this))
            {
                s.sąsiad.Add(this);
            }
        }
    }
    public class Wezel3
    {
        public int wartosc;
        public Wezel3 lewe;
        public Wezel3 prawe;
        public Wezel3 rodzic;

        public Wezel3(int wartosc)
        {
            this.wartosc = wartosc;
            this.prawe = null;
            this.lewe = null;
        }

        public void Add(int liczba)
        {
            var dziecko = new Wezel3(liczba);
            dziecko.rodzic = this;
            if (liczba < this.wartosc)
            {
                this.lewe = dziecko;
            }
            else
            {
                this.prawe = dziecko;
            }
        }

        public int GetliczbaDzieci()
        {
            int wynik = 0;
            if (this.lewe != null)
                wynik++;
            if (this.prawe != null)
                wynik++;

            return wynik;
        }


        public override string ToString()
        {
            return this.wartosc.ToString();
        }


    }
    class DrzewoBinarne
    {
        public Wezel3 korzen;
        public int LiczbaWezlow;
        public DrzewoBinarne(int liczba)
        {
            this.korzen = new Wezel3(liczba);
            this.LiczbaWezlow = 1;
        }

        public void Add(int a)
        {
            Wezel3 rodzic = this.ZnajdzRodzica(a);
            rodzic.Add(a);
        }

        private Wezel3 Znajdz(int liczba)
        {
            var w = this.korzen;
            while (true)
            {
                if (liczba == w.wartosc)
                {
                    return w;
                }
                if (liczba < w.wartosc)
                {
                    if (w.lewe == null)
                    {
                        return null;
                    }
                    else
                    {
                        w = w.lewe;
                    }
                }
                else
                {
                    if (w.prawe == null)
                    {
                        return null;
                    }
                    else
                    {
                        w = w.prawe;
                    }
                }
            }
        }
        public Wezel3 ZnajdzMin(Wezel3 w)
        {
            while (w.lewe != null)
            {
                w = w.lewe;
            }

            return w;
        }
        public Wezel3 ZnajdzMax(Wezel3 w)
        {
            while (w.prawe != null)
            {
                w = w.prawe;
            }

            return w;
        }
        public Wezel3 Nastepnik(Wezel3 w)
        {
            if (w.prawe != null)
            {
                return this.ZnajdzMin(w.prawe);
            }
            while (w.rodzic != null)
            {
                if (w.rodzic.lewe == w)
                {
                    return w.rodzic;
                }
                else
                {
                    w = w.rodzic;
                }
            }
            return null;
        }
        // Usun
        // 1) gdy nie ma dzieci to odwiazujemy -> usuwamy 1 , mowimy do 3 ze nie jest rodzicem 1 a 1 ze nie jest 3 dzieckiem 
        // 2) gdy jest jedno dziecko to wchodzi na miejsce rodzica 
        // w.rodzic = w; !!! 
        // 3) gdy 2 dzieci to rekurencja i wchodzimy w glab az dojde do nastepnika ktory ma jedno albo zero dzieci i wtedy zaczynaj sie cofac

        public Wezel3 Usun(Wezel3 w)
        {
            switch(w.GetliczbaDzieci())
            {
                case 0:
                    w = this.UsunGdy0Dzieci(w);
                    break;
                case 1:
                    w = this.UsunGdy1Dzieci(w);
                    break;
                case 2:
                    w = this.UsunGdy2Dzieci(w);
                    break;
            }
            return w;
        }

        Wezel3 UsunGdy0Dzieci(Wezel3 w)
        {
            if (w.rodzic == null)
            {
                this.korzen = null;
                return w;
            }
            if (w.rodzic.lewe == w)
                w.rodzic.lewe = null;
            else
                w.rodzic.prawe = null;
            w.rodzic = null;
            return w;
        }



        Wezel3 UsunGdy1Dzieci(Wezel3 w)
        {
            Wezel3 dziecko = null;
            if (w.lewe != null)
            {
                dziecko = w.lewe;
                w.lewe = null;
            }
            else;
            {
                dziecko = w.prawe;
                w.prawe = null;
            }
            dziecko.rodzic = w.rodzic;
            if (w.rodzic == null)
            {
                this.korzen = null;
                return w;
            }
            if (w.rodzic.lewe == w)      
                w.rodzic.lewe = dziecko;        
            else         
                w.rodzic.prawe = dziecko;
            w.rodzic = null;
            return w;
        }

        Wezel3 UsunGdy2Dzieci(Wezel3 w)
        {
            var zamiennik = this.Nastepnik(w);
            if (zamiennik.GetliczbaDzieci() == 0)
                zamiennik = this.UsunGdy0Dzieci(zamiennik);
            else
                zamiennik = this.UsunGdy1Dzieci(zamiennik);
            if (w.rodzic != null)
            {
                if (w.rodzic.lewe == w)
                {
                    w.rodzic.lewe = zamiennik;
                }
                else
                    w.rodzic.prawe = zamiennik;
            }
            zamiennik.rodzic = w.rodzic;
            w.rodzic = null;
            //niedokonczone

        }


        private Wezel3 ZnajdzRodzica(int a)
        {
            var w = this.korzen;

            while (true)
            {
                if (a < w.wartosc)
                {
                    if (w.lewe == null)
                    {
                        return w;
                    }
                    else
                    {
                        w = w.lewe;
                    }
                }
                else
                {
                    if (w.prawe == null)
                    {
                        return w;
                    }
                    else
                    {
                        w = w.prawe;
                    }
                }
            }
        }
    }
}
