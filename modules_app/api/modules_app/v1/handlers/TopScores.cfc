component extends=api.handlers.BaseHandler {

    property name="topscoreService" inject="quickService:Topscore@core";

    /**
     * Display a paginated list of TopScores
     * 
     */
    function index( event, rc, prc ){
        param rc.page = "1";
        param rc.maxrows = "25";
        prc.sortBy = "score";
        prc.descending = true;

        prc.sortDirection = prc.descending == false ? "asc" : "desc";

        prc.cleanedRC = vof( 
            target=rc, 
            constraints=getPaginationConstraints()
        );

        prc.topscores = topscoreService
            .addGravatar() 
            .orderBy( prc.sortBy, prc.sortDirection )
            .retrieveQuery()
            .paginate( prc.cleanedRC.page, prc.cleanedRC.maxrows );

        prc.response
            .setDataWithPagination( 
                prc.topscores
            );
    }

    /**
     * 
     * Creating a new Question
     * 
     */
    function create( event, rc, prc ) {

        prc.oQuestion = topscoreService
            .fill( this.vof( target=rc, constraints=topscoreService.getConstraints() ) )
            .vof()
            .save();
        
        prc.response
            .addMessage( "Top Score Added" );
            
    }

}