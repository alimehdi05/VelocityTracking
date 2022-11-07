using System;

namespace TreatsApi.Model.Response
{
    public class GridResponse
    {
        public string StatusCode { get; set; }
        public dynamic Data { get; set; }
        public int TotalNoRecords { get; set; }

        public int RecordsPerPage { get; set; }


    }
}

