using Npgsql;
using System;
using System.Data;
using System.Windows.Forms;

namespace NegarFathi
{
    public partial class EditForm : Form
    {
        int id = 0;

        public EditForm()
        {
            InitializeComponent();
        }

        public EditForm(int x)
        {
            InitializeComponent();
            id = x;
        }

        private void Edit_Load(object sender, EventArgs e)
        {
            NpgsqlConnection connection = new NpgsqlConnection("Server=127.0.0.1; Port=5432; User Id=postgres; Password=1; Database=Warehousing;");
            connection.Open();
            string query = "SELECT code, storekeeper_code, (phone[1], phone[2], phone[3]) AS phone, address, capacity FROM Warehouse WHERE code='" + id + "'";
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(query, connection);
            DataSet dataSet = new DataSet();
            DataTable dataTable = new DataTable(); dataSet.Reset();
            dataAdapter.Fill(dataSet);
            dataTable = dataSet.Tables[0];
            connection.Close();
            textBoxWarehouseCode.Text = dataTable.Rows[0]["code"].ToString();
            textBoxStorekeeperCode.Text = dataTable.Rows[0]["storekeeper_code"].ToString();
            textBoxWarehousePhone.Text = dataTable.Rows[0]["phone"].ToString();
            textBoxWarehouseAddress.Text = dataTable.Rows[0]["address"].ToString();
            textBoxWarehouseCapacity.Text = dataTable.Rows[0]["capacity"].ToString();
        }

        private void buttonEdit_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("اطلاعات انبار ویرایش شود؟", "هشدار", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                try
                {
                    NpgsqlConnection connection = new NpgsqlConnection("Server=127.0.0.1; Port=5432; User Id=postgres; Password=1; Database=Warehousing;");
                    connection.Open();
                    NpgsqlCommand command = connection.CreateCommand();
                    string query = "UPDATE Warehouse SET code='" + textBoxWarehouseCode.Text + "', storekeeper_code='" + textBoxStorekeeperCode.Text + "', phone=ARRAY['" + textBoxWarehousePhone.Text + "'], address='" + textBoxWarehouseAddress.Text + "', capacity='" + textBoxWarehouseCapacity.Text + "'";
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
            else
            {
                MainForm mainForm = new MainForm();
                mainForm.Show();
                Hide();
            }
        }

        private void EditForm_FormClosed(object sender, FormClosedEventArgs e)
        {
            MainForm mainForm = new MainForm();
            mainForm.Show();
            Hide();
        }
    }
}
