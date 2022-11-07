using System.Data;
using TreatsApi.Model.Repositories.Implementation;
using TreatsApi.Model.Repositories.Interface;

namespace VelocityTracking.Models
{
    public class EmployeeDetails
    {
        public int Emp_ID { get; set; }
        public int Employees { get; set; }
        public float EstimatedHours { get; set; }
        public float ActualHours { get; set; }

   
    }
    
    public class ProjectDetails
    {
        public int PD_Id { get; set; }
        public int Projects { get; set; }
        public string TaskTitle { get; set; }
        public string TaskDescription { get; set; }
        public float TotalEstimate { get; set; }
        public List<EmployeeDetails> LstEmployees { get; set; }


        public async Task<bool> AddProjectAndEmployeeDetails()
        {
            try
            {
                return await Task.Run(() =>
                {

                    DataTable dtEmployeeDetails = new DataTable();
                    dtEmployeeDetails.Columns.Add("Employees");
                    dtEmployeeDetails.Columns.Add("EstimatedHours");
                    dtEmployeeDetails.Columns.Add("ActualHours");
                    dtEmployeeDetails.Columns.Add("CreateDate");
                    LstEmployees.ForEach(employee =>
                    {

                        dtEmployeeDetails.Rows.Add(
                            new object[] {

                  
                                employee.Employees
                          ,
                                employee.EstimatedHours
                          ,
                                employee.ActualHours

                          ,     0
                
                            }
                            );

                    });
                    INetworkRepo networkRepo = new NetworkRepo();



                    Dictionary<string, object> parms = new Dictionary<string, object>
                    {
                        {"udt_insEmpDetails",    dtEmployeeDetails}
                        ,{"Projects", Projects}
                        ,{"TaskTitle ",  TaskTitle}
                        ,{"TaskDescription", TaskDescription}
                        ,{"TotalEstimate", TotalEstimate}

                    };

                    DataSet ds = networkRepo.CustomTypeDataTable("sp_InsertProjectAndEmployeeDetails", parms);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        this.PD_Id = ds.Tables[0].Rows[0].GetValue<int>("pd_ID");
                    }
                    return (this.PD_Id > 0);
                });

            }
            catch (Exception ex)
            {
                Console.WriteLine("AddTagContentDataFromAssosiatedDevice " + ex);
                return false;
            }
        }
    }
}
