
    $(document).ready(function (){
        $('#avisPoste').DataTable({
            dom: 'lftrip',
            language:{
                url:"../public/datatable/js/French.json"
            }
        });
    });

    

    $(document).ready(function (){
        $('#avisAttente').DataTable({
            dom: 'lftrip',
            language:{
                url:"../public/datatable/js/French.json"
            }
        });
    });