using RxWeb.Core.Annotations;
using RxWeb.Core.Data.Annotations;
using RxWeb.Core.Sanitizers;

using RxWebSampleApp.BoundedContext.SqlContext;
using RxWebSampleApp.Models.Enums.Main;

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace RxWebSampleApp.Models.Main
{
    [Table("ApplicationLocales", Schema = "dbo")]
    public partial class ApplicationLocale
    {
        #region ApplicationLocaleId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
        #endregion ApplicationLocaleId Annotations

        public int ApplicationLocaleId { get; set; }

        #region LocaleCode Annotations

        [Required]
        [MaxLength(50)]
        #endregion LocaleCode Annotations

        public string LocaleCode { get; set; }

        #region LocaleName Annotations

        [Required]
        [MaxLength(300)]
        #endregion LocaleName Annotations

        public string LocaleName { get; set; }

        #region StatusId Annotations

        [Range(1, int.MaxValue)]
        [Required]
        #endregion StatusId Annotations

        public Status StatusId { get; set; }


        public ApplicationLocale()
        {
        }
    }
}