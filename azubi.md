# AZUBI.DE

https://www.azubi.de

## Pull API

Our application is able to process data streams served via HTTP of different format. If you already have your
jobs wrapped into a custom data stream ready to read via HTTP, please [contact our team](mailto:api@absolventa.de) to verify
if we can handle it.

Here's an ideal XML feed for our application AZUBI.DE. If you are able to provide your job
data in this format, we can immediately configure a connection:
```XML
<?xml version='1.0' encoding='utf-8' ?>
<job_offers type='array'>
  <job_offer>
    <external_id>145-D-22</external_id>
    <mode>standard</mode>
    <title>Ausbildung Bankkaufmann/-frau</title>
    <started_at type='datetime'>
      2017-07-07T00:00:00+02:00
    </started_at>
    <apprenticeship_started_at type='datetime'>
      2017-07-07T00:00:00+02:00
    </started_at>
    <external_url>
      <![CDATA[http:/example.com/jobs/145-D-22]]>
    </external_url>
    <application_url>
      <![CDATA[http://www.example.com/jobs/145-D-22/apply]]>
    </application_url>
    <description>
      <![CDATA[Lorem Ipsum]]>
    </description>
    <company_description>
      <![CDATA[Lorem Ipsum]]>
    </company_description>
    <!--Possible values for minimal degree:  -->
    <!-- basic (Hauptschulabschluss)  -->
    <!-- certificate (Mittlere Reife)  -->
    <!-- graduation ([Fach-]Abitur)  -->
    <minimal_degree>basic</minimal_degree>
    <duration>36</duration><!-- months -->
    <contact_name>Rosi Beckers</contact_name>
    <job_offer_locations type='array'>
      <job_offer_location>
        <street>Friedrichstrasse 67</street>
        <zip>10117</zip>
        <city>Berlin</city>
        <country>Deutschland</country>
        <vacancies>3</vacancies>
      </job_offer_location>
    </job_offer_locations>
  </job_offer>
  <job_offer>
    ...
  </job_offer>
</job_offers>
```
