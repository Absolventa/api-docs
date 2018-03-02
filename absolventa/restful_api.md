# ABSOLVENTA RESTful API

Our RESTful API accepts two different XML based data formats
to manage your job offers headlessly: `Absolventa XML` and `HR-XML`, which
nowadays is sometimes called `HR Open Standards`.

## Authentication

Our RESTful API uses HTTP Basic Authentication. Your account manager will hand out you an API key. Please
provide it as username for HTTP Basic Authentication. Leave the password
blank or fill it with a fallback letter like <code>"X"</code>.

## Data formats

### Absolventa XML

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

### HR-XML
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
## Endpoints

* [List all published job offers](#list-published-job-offers)
* [List all draft job offers](#list-draft-job-offers)
* [List all expired job offers](#list-expired-job-offers)
* [Create a job offer using Absolventa XML](#create-a-job-offer-using-absolventa-xml)
* [Update a job offer using Absolventa XML](#update-a-job-offer-using-absolventa-xml)
* [Create a job offer using HR-XML](#create-a-job-offer-using-hr-xml)
* [Update a job offer using HR-XML](#update-a-job-offer-using-hr-xml)
* [End a job offer ](#end-a-job-offer)
* [Prolongate a job offer](#prolongate-a-job-offer)


### List published job offers

List all job offers that are available in our public search interface.

<table>
  <tbody>
    <tr>
      <td>Endpoint</td>
      <td>HTTP method</td>
      <td>Response Format</td>
    </tr>
    <tr>
      <td>/api/r/job_offers.xml</td>
      <td>GET</td>
      <td>Absolventa XML</td>
    </tr>
  </tbody>
</table>

#### Example

```
curl -i -H 'Accept: application/xml' -u 28a622e8ea6665433729932112d1d9cc:X https://www.absolventa.de/api/r/job_offers.xml
```

### List draft job offers

List all job offers that are drafts (⇔ unpublished) and therefore haven't been available to be listed in our publich search interface yet.

<table>
  <tbody>
    <tr>
      <td>Endpoint</td>
      <td>HTTP method</td>
      <td>Response Format</td>
    </tr>
    <tr>
      <td>/api/r/job_offers/drafts.xml</td>
      <td>GET</td>
      <td>Absolventa XML</td>
    </tr>
  </tbody>
</table>

#### Example

```
curl -i -H 'Accept: application/xml' -u 28a622e8ea6665433729932112d1d9cc:X https://www.absolventa.de/api/r/job_offers/drafts.xml
```

### List expired job offers

List all job offers that are not available to be listed in our public search interface any longer because their ended_at value refers to a date in the past.

<table>
  <tbody>
    <tr>
      <td>Endpoint</td>
      <td>HTTP method</td>
      <td>Response Format</td>
    </tr>
    <tr>
      <td>/api/r/job_offers/expired.xml</td>
      <td>GET</td>
      <td>Absolventa XML</td>
    </tr>
  </tbody>
</table>

#### Example

```
curl -i -H 'Accept: application/xml' -u 28a622e8ea6665433729932112d1d9cc:X https://www.absolventa.de/api/r/job_offers/expired.xml
```

### Create a job offer using Absolventa XML

<table>
  <tbody>
    <tr>
      <td>Endpoint</td>
      <td>HTTP method</td>
      <td>Data Format</td>
    </tr>
    <tr>
      <td>/api/r/job_offers.xml</td>
      <td>POST</td>
      <td>Absolventa XML</td>
    </tr>
  </tbody>
</table>

#### Example

```
curl -i -X POST -H 'Accept: application/xml' -H 'Content-Type: application/xml'
     -u 28a622e8ea6665433729932112d1d9cc:X
     -d '<job_offer>Trainee Web Development (m/w)<title></title><description>Eine Beschreibung</description><!-- … --></job_offer>'
     https://www.absolventa.de/api/r/job_offers.xml
```

### Update a job offer using Absolventa XML

<table>
  <tbody>
    <tr>
      <td>Endpoint</td>
      <td>HTTP method</td>
      <td>Data Format</td>
    </tr>
    <tr>
      <td>/api/r/job_offers/{id}.xml</td>
      <td>PUT</td>
      <td>Absolventa XML</td>
    </tr>
  </tbody>
</table>

#### Example

```
curl -i -X PUT -H 'Accept: application/xml' -H 'Content-Type: application/xml'
     -u 28a622e8ea6665433729932112d1d9cc:X
     -d '<job_offer>Trainee Web Development (m/w)<title></title><description>Eine neue Beschreibung</description><!-- … --></job_offer>'
     https://www.absolventa.de/api/r/job_offers/12345.xml
```

### Create a job offer using HR-XML

<table>
  <tbody>
    <tr>
      <td>Endpoint</td>
      <td>HTTP method</td>
      <td>Data Format</td>
    </tr>
    <tr>
      <td>/api/r/hrxml/job_offers.xml</td>
      <td>POST</td>
      <td>HR-XML</td>
    </tr>
  </tbody>
</table>

#### Example

```
curl -i -X POST -H 'Accept: application/xml' -H 'Content-Type: application/xml'
     -u 28a622e8ea6665433729932112d1d9cc:X
     -d '<PositionOpening>
           <PositionRecordInfo>
             <Id idOwner="Threepwod Ventures">
               <IdValue>42</IdValue>
             </Id>
           </PositionRecordInfo>
           <PositionPostings>
             <PositionPosting>
               <Id validFrom="2014-01-12" validTo="2015-06-12">
                 <IdValue>42</IdValue>
               </Id>
               <Link><![CDATA[http://www.example.com/jobs/1]]></Link>
             </PositionPosting>
           </PositionPostings>
           <PositionProfile>
             <PositionDateInfo></PositionDateInfo>
             <PositionDetail>
               <Company>
                 <Name>Threepwood Ventures</Name>
               </Company>
               <PhysicalLocation>
                 <PostalAddress>
                   <CountryCode>DE</CountryCode>
                   <PostalCode>10405</PostalCode>
                   <Municipality>Berlin</Municipality>
                   <DeliveryAddress>
                     <StreetName>Melee-Island-Street</StreetName>
                     <BuildingNumber>42</BuildingNumber>
                   </DeliveryAddress>
                 </PostalAddress>
               </PhysicalLocation>
               <PhysicalLocation>
                 <PostalAddress>
                   <CountryCode>DE</CountryCode>
                   <PostalCode>63067</PostalCode>
                   <Municipality>Offenbach am Main</Municipality>
                   <DeliveryAddress>
                     <StreetName>Hölderlinstraße</StreetName>
                     <BuildingNumber>42</BuildingNumber>
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
               <Value>Company description goes here!</Value>
             </FormattedPositionDescription>
             <FormattedPositionDescription>
               <Name>JobOfferPositionIds</Name>
               <Value>1</Value>
             </FormattedPositionDescription>
              <Name>JobOfferDescription</Name>
               <Value>
                 <![CDATA[Here is a nice description]]>
               </Value>
             </FormattedPositionDescription>
             <FormattedPositionDescription>
               <Name>TraineeGefluester</Name>
               <Value>1</Value>
             </FormattedPositionDescription>
             <HowToApply>
               <ApplicationMethod>
                 <InternetWebAddress><![CDATA[http://example.com/jobs/1/application]]></InternetWebAddress>
               </ApplicationMethod>
             </HowToApply>
            </PositionProfile>
          </PositionOpening>'
     https://www.absolventa.de/api/r/hrxml/job_offers.xml
```

### Update a job offer using HR-XML

<table>
  <tbody>
    <tr>
      <td>Endpoint</td>
      <td>HTTP method</td>
      <td>Data Format</td>
    </tr>
    <tr>
      <td>/api/r/hrxml/job_offers/{id}.xml</td>
      <td>PUT</td>
      <td>HR-XML</td>
    </tr>
  </tbody>
</table>

#### Example

```
curl -i -X PUT -H 'Accept: application/xml' -H 'Content-Type: application/xml'
     -u 28a622e8ea6665433729932112d1d9cc:X
     -d '<PositionOpening>
           <PositionRecordInfo>
             <Id idOwner="Threepwod Ventures">
               <IdValue>42</IdValue>
             </Id>
           </PositionRecordInfo>
           <PositionPostings>
             <PositionPosting>
               <Id validFrom="2014-01-12" validTo="2015-06-12">
                 <IdValue>42</IdValue>
               </Id>
               <Link><![CDATA[http://www.example.com/jobs/1]]></Link>
             </PositionPosting>
           </PositionPostings>
           <PositionProfile>
             <PositionDateInfo></PositionDateInfo>
             <PositionDetail>
               <Company>
                 <Name>Threepwood Ventures</Name>
               </Company>
               <PhysicalLocation>
                 <PostalAddress>
                   <CountryCode>DE</CountryCode>
                   <PostalCode>10405</PostalCode>
                   <Municipality>Berlin</Municipality>
                   <DeliveryAddress>
                     <StreetName>Melee-Island-Street</StreetName>
                     <BuildingNumber>42</BuildingNumber>
                   </DeliveryAddress>
                 </PostalAddress>
               </PhysicalLocation>
               <PhysicalLocation>
                 <PostalAddress>
                   <CountryCode>DE</CountryCode>
                   <PostalCode>63067</PostalCode>
                   <Municipality>Offenbach am Main</Municipality>
                   <DeliveryAddress>
                     <StreetName>Hölderlinstraße</StreetName>
                     <BuildingNumber>42</BuildingNumber>
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
               <Value>Company description goes here!</Value>
             </FormattedPositionDescription>
             <FormattedPositionDescription>
               <Name>JobOfferPositionIds</Name>
               <Value>1</Value>
             </FormattedPositionDescription>
              <Name>JobOfferDescription</Name>
               <Value>
                 <![CDATA[Here is a nice description]]>
               </Value>
             </FormattedPositionDescription>
             <FormattedPositionDescription>
               <Name>TraineeGefluester</Name>
               <Value>1</Value>
             </FormattedPositionDescription>
             <HowToApply>
               <ApplicationMethod>
                 <InternetWebAddress><![CDATA[http://example.com/jobs/1/application]]></InternetWebAddress>
               </ApplicationMethod>
             </HowToApply>
            </PositionProfile>
          </PositionOpening>'
     https://www.absolventa.de/api/r/hrxml/job_offers/12345.xml
```

### End a job offer

If you want to unpublish a job offer before its natural end of runtime, you can perform a PUT request to the corresponding endpoint as shown below.
By this endpoint you can also edit the current end date to a new value. To achieve this, wrap your requested datetime wrapped in XML like this and send it
as data attached to your request:

<code>
  &ltended_at&gt2019-01-01&lt/ended_at&gt
</code>

Note that your requested date has to
be before the job offer's current value of ended_at.

<table>
  <tbody>
    <tr>
      <td>Endpoint</td>
      <td>HTTP method</td>
      <td>Data Format</td>
    </tr>
    <tr>
      <td>/api/r/job_offers/{id}/quit.xml</td>
      <td>PUT</td>
      <td>Absolventa XML or HR-XML</td>
    </tr>
  </tbody>
</table>

#### Examples

```
curl -X PUT -H 'Accept: application/xml'
            -H 'Content-Type: application/xml'&#x000A;
            -u 28a622e8ea6665433729932112d1d9cc:X
            https://www.absolventa.de/api/r/job_offers/12345/quit.xml

curl -X PUT -H 'Accept: application/xml'
            -H 'Content-Type: application/xml'&#x000A;
            -u 28a622e8ea6665433729932112d1d9cc:X
            -d '<ended_at>2019-07-28T14:27:31+02:00</ended_at>'
            https://www.absolventa.de/api/r/job_offers/12345/quit.xml
```

### Prolongate a job offer

Prior to the expiration date, the runtime of a <em>standard</em> job offer can be extended by another 12 months.

<table>
  <tbody>
  <tr>
    <td>Endpoint</td>
    <td>HTTP method</td>
    <td>Data Format</td>
  </tr>
  <tr>
    <td>/api/r/job_offers/{id}/prolongate.xml</td>
    <td>PUT</td>
    <td>Absolventa XML or HR-XML</td>
  </tr>
  </tbody>
</table>

#### Examples

```
curl -X PUT -H 'Accept: application/xml'
            -H 'Content-Type: application/xml'&#x000A;
            -u 28a622e8ea6665433729932112d1d9cc:X
            https://www.absolventa.de/api/r/job_offers/12345/prolongate.xml
```
