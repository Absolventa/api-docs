# ABSOLVENTA

https://www.absolventa.de

# RESTful API

Our RESTful API accepts two different formats based on XML
to manage your job offers headlessly: `AbsolventaXML` and `HR-XML`, which
nowadays is sometimes called `HR Open Standards`.

## Endpoints
<table>
  <thead>
    <tr>
      <th>Action</th>
      <th>Format</th>
      <th>HTTP method</th>
      <th>ENDPOINT</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Creation of a new job offer</td>
      <td>Absolventa XML</td>
      <td>POST</td>
      <td>/api/r/job_offers.xml</td>
    </tr>
    <tr>
      <td>Creation of a new job offer</td>
      <td>HR-XML</td>
      <td>POST</td>
      <td>/api/r/hrxml/job_offers.xml</td>
    </tr>
    <tr>
      <td>Update of an existing job offer</td>
      <td>Absolventa XML</td>
      <td>PUT</td>
      <td>/api/r/job_offers/{id}.xml</td>
    </tr>
    <tr>
      <td>Update of an existing job offer</td>
      <td>HR-XML</td>
      <td>PUT</td>
      <td>/api/r/hrxml/job_offers/{id}.xml</td>
    </tr>
    <tr>
      <td>Ending a job offer</td>
      <td>Absolventa XML or HR-XML</td>
      <td>PUT</td>
      <td>/api/r/job_offers/{id}.xml</td>
    </tr>
  </tbody>
</table>

## Authentication

After your account manager has handed out you your API key, please
provide it as username for HTTP Basic Authentication. Leave the password
blank for fill it with fallback letter "X".

## Data formats

### Absolventa XML

```XML
<job_offer>
  <id type="integer">12345</id>
  <mode>premium</mode>
  <title>Trainee Web Development</title>
  <external_url>https://example.com/jobs/1</external_url>
  <description><![CDATA[<p>Some HTML tags are allowed here</p>]]></description>
  <started_at type="datetime">2017-01-03T00:00:00+02:00</started_at>
  <ended_at type="datetime">2017-12-10T12:14:42+01:00</ended_at>
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
  <trainee_gefluester>true</trainee_gefluester>
  <use_responsive_template>true</use_responsive_template>
  <height>1200</height>
</job_offer>
```

# Pull API

TODO: Fill me.
