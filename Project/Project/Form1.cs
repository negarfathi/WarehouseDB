using Npgsql;
using System;
using System.Data;
using System.Windows.Forms;

namespace NegarFathi
{
    public partial class MainForm : Form
    {
        int id = 0;

        public MainForm()
        {
            InitializeComponent();
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            NpgsqlConnection connection = new NpgsqlConnection("Server=127.0.0.1; Port=5432; User Id=postgres; Password=1; Database=Warehousing;");
            connection.Open();
            string query = "SELECT code, storekeeper_code, (phone[1], phone[2], phone[3]) AS phone, address, capacity FROM Warehouse";
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(query, connection);
            DataSet dataSet = new DataSet();
            DataTable dataTable = new DataTable();
            dataSet.Reset();
            dataAdapter.Fill(dataSet);
            dataTable = dataSet.Tables[0];
            dataGridView.DataSource = dataTable;
            connection.Close();
        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
            AddForm addForm = new AddForm();
            addForm.Show();
            Hide();
        }

        private void dataGridView_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            id = (int)dataGridView.SelectedRows[0].Cells[0].Value;
        }

        private void buttonEdit_Click(object sender, EventArgs e)
        {
            if (id == 0)
            {
                MessageBox.Show(".یکی از سطرهای جدول را انتخاب کنید");
            }
            else
            {
                EditForm editForm = new EditForm(id);
                editForm.Show();
                Hide();
            }
        }

        private void buttonDelete_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("اطلاعات انبار حذف شود؟", "هشدار", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                NpgsqlConnection connection = new NpgsqlConnection("Server=127.0.0.1; Port=5432; User Id=postgres; Password=1; Database=Warehousing;");
                connection.Open();
                NpgsqlCommand command = connection.CreateCommand();
                string query = "DELETE FROM Warehouse WHERE code='" + id + "'";
                command.CommandText = query;
                command.ExecuteNonQuery();
                connection.Close();
                MainForm_Load(sender, e);
            }
            else
            {
                MainForm_Load(sender, e);
            }
        }

        private void buttonSearch_Click(object sender, EventArgs e)
        {
            dataGridView.DataSource = null;
            NpgsqlConnection connection = new NpgsqlConnection("Server=127.0.0.1; Port=5432; User Id=postgres; Password=1; Database=Warehousing;");
            connection.Open();
            string query = "SELECT code, storekeeper_code, (phone[1], phone[2], phone[3]) AS phone, address, capacity FROM Warehouse WHERE code='" + textBoxSearch.Text.Trim() + "'";
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter(query, connection);
            DataSet dataSet = new DataSet();
            DataTable dataTable = new DataTable();
            dataSet.Reset();
            dataAdapter.Fill(dataSet);
            dataTable = dataSet.Tables[0];
            dataGridView.DataSource = dataTable;
            connection.Close();
            textBoxSearch.Text = "";
        }

        private void buttonShowAll_Click(object sender, EventArgs e)
        {
            MainForm_Load(sender, e);
        }

        private void MainForm_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }
    }
}
