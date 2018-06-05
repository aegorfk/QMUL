<html>
            <head>Boat Listing</head>
            <body>
                <p>Your search was: price  100000, length &lt; 40 feet.</p>
                
                <br/>
                <table border="1">
                     {
                        for $x in doc("boats.xml")/boats/boat
                        where $x/price < 100000 and $x/length < 40
                        return 
                            <tr>
                            <td>{data($x/name)}</td>
                            <td>{data($x/make)}</td>
                            <td>{data($x/type)}</td>
                            <td>{data($x/year)}</td>
                            <td>{data($x/length)}</td>
                            <td>{data($x/price)}</td>
                            <!-- a table cell per feature of the boat -->
                           </tr>
                        }
                    <!-- a table row per boat -->
                </table>
            </body>
        </html>