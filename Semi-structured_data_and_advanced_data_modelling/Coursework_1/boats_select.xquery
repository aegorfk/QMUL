<boats>
    {
        for $x in doc("boats.xml")/boats/boat
        where $x/price < 100000 and $x/length < 40
        return $x
    }
</boats>