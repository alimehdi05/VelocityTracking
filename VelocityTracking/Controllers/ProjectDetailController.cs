using Microsoft.AspNetCore.Mvc;
using VelocityTracking.Models;
// For more information on ena

namespace VelocityTracking.Controllers
{
    public class ProjectDetailController : ControllerBase
    {
        [HttpPost("InsertProjectAndemployeeDetails")]
        public async Task<IActionResult> AddProjectAndEmployeeDetails(ProjectDetails pd)
        {
            bool isSuccess = await pd.AddProjectAndEmployeeDetails();
            if (isSuccess)
                return Ok(pd);
            else
                return StatusCode(500, "Some error occoured!");
        }

    }
}
