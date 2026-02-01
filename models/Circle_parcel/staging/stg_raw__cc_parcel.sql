with 

source as (

    select * from {{ source('raw', 'cc_parcel') }}

),

renamed as (

    select
        parcel_id,
        parcel_tracking,
        transporter,
        priority,
        date_purchase,
        date_shipping,
        date_delivery,
        datecancelled as date_cancelled

    from source

)

select * from renamed