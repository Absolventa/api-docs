# ABSOLVENTA

https://www.absolventa.de

## RESTful API

Our RESTful API accepts two different XML based data formats
to manage your job offers headlessly: `Absolventa XML` and `HR-XML`, which
nowadays is sometimes called `HR Open Standards`.

### Endpoints
<table>
  <thead>
    <tr>
      <th>Action</th>
      <th>Format</th>
      <th>HTTP method</th>
      <th>ENDPOINT</th>
      <th>Further Notes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>List all job offers that are available to be listed in our public search interface</td>
      <td>Absolventa XML</td>
      <td>GET</td>
      <td>/api/r/job_offers.xml</td>
      <td></td>
    </tr>
    <tr>
      <td>List all job offers that are drafts (⇔ unpublished) and therefore haven't been available to be listed in our publich search interface yet</td>
      <td>Absolventa XML</td>
      <td>GET</td>
      <td>/api/r/job_offers/draft.xml</td>
      <td></td>
    </tr>
    <tr>
      <td>List all job offers that are not available to be listed in our public search interface any longer because their ended_at value refers to a date in the past</td>
      <td>Absolventa XML</td>
      <td>GET</td>
      <td>/api/r/job_offers/expired.xml</td>
      <td></td>
    </tr>
    <tr>
      <td>Creation of a new job offer</td>
      <td>Absolventa XML</td>
      <td>POST</td>
      <td>/api/r/job_offers.xml</td>
      <td></td>
    </tr>
    <tr>
      <td>Creation of a new job offer</td>
      <td>HR-XML</td>
      <td>POST</td>
      <td>/api/r/hrxml/job_offers.xml</td>
      <td></td>
    </tr>
    <tr>
      <td>Update of an existing job offer</td>
      <td>Absolventa XML</td>
      <td>PUT</td>
      <td>/api/r/job_offers/{id}.xml</td>
      <td></td>
    </tr>
    <tr>
      <td>Update of an existing job offer</td>
      <td>HR-XML</td>
      <td>PUT</td>
      <td>/api/r/hrxml/job_offers/{id}.xml</td>
      <td></td>
    </tr>
    <tr>
      <td>Ending a job offer</td>
      <td>Absolventa XML or HR-XML</td>
      <td>PUT</td>
      <td>/api/r/job_offers/{id}/quit.xml</td>
      <td>
        If you want to unpublish a job offer at a specific point in time you can submit your
        requested datetime like this attached to the request:
        <code>
          &ltended_at&gt2019-01-01&lt/ended_at&gt
        </code>
        Note that your requested date has to
        be before the job offer's current value of ended_at.
      </td>
    </tr>
    <tr>
      <td>Prolongate a job offer</td>
      <td>Absolventa XML or HR-XML</td>
      <td>PUT</td>
      <td>/api/r/job_offers/{id}/prolongate.xml</td>
      <td>Prior to the expiration date, the runtime of a <em>standard</em> job offer can be extended by another 12 months.</td>
    </tr>
  </tbody>
</table>

### Authentication

After your account manager has handed out you your API key, please
provide it as username for HTTP Basic Authentication. Leave the password
blank or fill it with a fallback letter like <code>"X"</code>

### Data formats

#### Absolventa XML

```XML
<job_offer>
  <mode>premium</mode>
  <title>Trainee Web Development (m/w)</title>
  <external_url>https://example.com/jobs/1</external_url>
  <description><![CDATA[<p>Basic HTML tags are allowed here</p>]]></description>
  <started_at type="datetime">2017-01-03T00:00:00+02:00</started_at>
  <ended_at type="datetime">2017-12-10T12:14:42+01:00</ended_at>
  <!-- You need to either provide an URL or an email address for application. -->
  <application_url>https://example.com/jobs/1/apply</application_url>
  <application_email>application@absolventa.de</application_email>
  <job_offer_locations>
    <job_offer_location>
      <street>Friedrichstraße 67</street>
      <zip>10117</zip>
      <city>Berlin</city>
      <country>Deutschland</country>
    </job_offer_location>
    <job_offer_location>
      <street>Greifswalder Straße 212</street>
      <zip>10405</zip>
      <city>Berlin</city>
      <country>Deutschland</country>
    </job_offer_location>
  </job_offer_locations>
  <contact_name>Rosi Beckers</contact_name>
  <contact_email>rosi.beckers@absolventa.de</contact_email>
  <contact_phone>030240483121</contact_name>
  <contact_position>Leitung Personalwesen</contact_position>
  <trainee_gefluester>true</trainee_gefluester>
  <use_responsive_template>true</use_responsive_template>
  <height>1200</height>
</job_offer>
```

#### HR-XML
```XML
<PositionOpening>
 <PositionPostings>
   <PositionPosting>
     <Id validFrom="2017-01-03" validTo="2017-12-10">
       <!-- Note that the ID is auto-assigned when using the RESTful API -->
       <IdValue>12345</IdValue>
     </Id>
     <Link><![CDATA[https://example.com/jobs/1]]></Link>
   </PositionPosting>
 </PositionPostings>
 <PositionProfile>
   <PositionDetail>
     <PhysicalLocation>
       <PostalAddress>
         <CountryCode>DE</CountryCode>
         <PostalCode>10405</PostalCode>
         <Municipality>Berlin</Municipality>
         <DeliveryAddress>
           <StreetName>Greifswader Straße</StreetName>
           <BuildingNumber>212</BuildingNumber>
         </DeliveryAddress>
       </PostalAddress>
     </PhysicalLocation>
     <PhysicalLocation>
       <PostalAddress>
         <CountryCode>DE</CountryCode>
         <PostalCode>10117</PostalCode>
         <Municipality>Berlin</Municipality>
         <DeliveryAddress>
           <StreetName>Friedrichsstraße</StreetName>
           <BuildingNumber>67</BuildingNumber>
         </DeliveryAddress>
       </PostalAddress>
     </PhysicalLocation>
     <PositionTitle><![CDATA[Trainee Web Development (m/w)]]></PositionTitle>
   </PositionDetail>
   <FormattedPositionDescription>
     <Name>Mode</Name>
     <Value>standard</Value>
   </FormattedPositionDescription>
   <FormattedPositionDescription>
     <Name>CompanyDescription</Name>
     <Value><![CDATA[<p>Basic HTML tags are allowed here</p>]]></Value>
   </FormattedPositionDescription>
   <FormattedPositionDescription>
     <Name>JobOfferDescription</Name>
     <Value>
       <![CDATA[<p>Basic HTML tags are allowed here</p>]]>
     </Value>
   </FormattedPositionDescription>
   <FormattedPositionDescription>
     <Name>TraineeGefluester</Name>
     <Value>1</Value>
   </FormattedPositionDescription>
   <FormattedPositionDescription>
     <Name>UseResponsiveTemplate</Name>
     <Value>true</Value>
   </FormattedPositionDescription>
   <FormattedPositionDescription>
     <Name>Height</Name>
     <Value>1234</Value>
   </FormattedPositionDescription>
   <HowToApply>
     <ApplicationMethod>
       <InternetWebAddress><![CDATA[https://example.com/jobs/1/apply]]></InternetWebAddress>
     </ApplicationMethod>
   </HowToApply>
  </PositionProfile>
</PositionOpening>
```
## Pull API

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
