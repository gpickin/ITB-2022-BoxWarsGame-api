component {
    
    function up( schema, qb ) {
        schema.create( "topscores", function( table ) {
            table.increments( "topscoreID" );
            table.string( "userName" );
            table.string( "email" );
            table.integer( "score" );
            table.timestamp( "createdDate" );
            table.timestamp( "modifiedDate" );
        } );
    }

    function down( schema, qb ) {
        schema.drop( "topscores" );
    }

}
