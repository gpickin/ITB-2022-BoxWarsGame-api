component extends="core.models.BaseEntity" table="topscores" accessors="true" {

    property name="topscoreID" column="topscoreID" setter="false";
    property name="userName";
    property name="email";
    property name="score";

    variables._key = "topscoreID";

    function scopeAddGravatar( qb ) {
        qb.selectRaw( "
            concat( 'https://www.gravatar.com/avatar/', md5( email ) ) as gravatar
        " );
    }
    
    this.constraints = {
        "userName": {
            required: true,
            size: "1..255"
        },
        "email": {
            required: true,
            size: "1..255"
        },
        "score": {
            required: true,
            type: "numeric",
            size: "1..5"
        }
    }
}