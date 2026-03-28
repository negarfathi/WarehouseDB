using Npgsql;
using System;
using System.Windows.Forms;

namespace NegarFathi
{
    public partial class AddForm : Form
    {
        public AddForm()
        {
            InitializeComponent();
        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("اطلاعات انبار افزوده شود؟", "هشدار", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                if (textBoxWarehouseCode.Text.Equals("") || textBoxStorekeeperCode.Text.Trim().Equals("") || textBoxWarehousePhone1.Text.Trim().Equals("") || textBoxWarehouseCity.Text.Trim().Equals("") || textBoxWarehouseStreet.Text.Trim().Equals("") || textBoxWarehouseAlley.Text.Equals("") || textBoxWarehouseCapacity.Text.Equals(""))
                {
                    MessageBox.Show(".اطلاعات ناقص است");
                }
                else
                {
                    try
                    {
                        NpgsqlConnection connection = new NpgsqlConnection("Server=127.0.0.1; Port=5432; User Id=postgres; Password=1; Database=Warehousing;");
                        connection.Open();
                        NpgsqlCommand command = connection.CreateCommand();
                        string query = "INSERT INTO Warehouse VALUES ('" + textBoxWarehouseCode.Text + "', '" + textBoxStorekeeperCode.Text + "', ARRAY['" + textBoxWarehousePhone1.Text + "', '" + textBoxWarehousePhone2.Text + "', '" + textBoxWarehousePhone3.Text + "'], ('" + textBoxWarehouseCity.Text + "', '" + textBoxWarehouseStreet.Text + "', '" + textBoxWarehouseAlley.Text + "'), '" + textBoxWarehouseCapacity.Text + "')";
                        command.CommandText = query;
                        command.ExecuteNonQuery();
                        connection.Close();
                        MainForm mainForm = new MainForm();
                        mainForm.Show();
                        Hide();
                    }
                    catch (Exception)
                    {
                        MessageBox.Show(".محدودیت کلید اصلی یا کلید خارجی رعایت نشده است");
                    }

                }
            }
            else
            {
                MainForm mainForm = new MainForm();
                mainForm.Show();
                Hide();
            }
        }

        private void AddForm_FormClosed(object sender, FormClosedEventArgs e)
        {
            MainForm mainForm = new MainForm();
            mainForm.Show();
            Hide();
        }
    }
}
