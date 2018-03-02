## ABSOLVENTA Pull API

Our application is able to process data streams served via HTTP of different format. If you already have your
jobs wrapped into a custom data stream ready to read via HTTP, please [contact our team](mailto:api@absolventa.de) to verify
if we can handle it.

Here's an ideal XML feed for our application ABSOLVENTA. If you are able to provide your job
data in this format, we can immediately configure a connection:

```XML
<?xml version='1.0' encoding='utf-8' ?>
<job_offers type='array'>
  <job_offer>
    <external_id>145-D-22</external_id>
    <mode>standard</mode>
    <title>Studienbegleitendes Praktikum Vertriebsassistenz</title>
    <started_at type='datetime'>
      2017-07-07T00:00:00+02:00
    </started_at>
    <ended_at type='datetime'>
      2017-10-11T00:00:00+02:00
    </ended_at>
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
    <contact_name>Rosi Beckers</contact_name>
    <contact_email>rosi.beckers@absolventa.de</contact_email>
    <contact_phone>030240483121</contact_name>
    <contact_position>Leitung Personalwesen</contact_position>
    <trainee_geflueser>true</trainee_geflueser>
    <job_offer_locations type='array'>
      <job_offer_location>
        <street>Friedrichstrasse 67</street>
        <zip>10117</zip>
        <city>Berlin</city>
        <country>Deutschland</country>
      </job_offer_location>
      <job_offer_location>
        <zip>10405</zip>
        <city>Berlin</city>
      </job_offer_location>
    </job_offer_locations>
  </job_offer>
  <job_offer>
    ...
  </job_offer>
</job_offers>
```
