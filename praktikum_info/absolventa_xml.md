# Absolventa XML

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

### Data fields

<table>
  <thead>
    <tr>
      <th>attribute</th>
      <th>value</th>
      <th>type</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>id</td>
      <td>Our database ID of the job offer record</td>
      <td>String</td>
      <td>required</td>
    </tr>
    <tr>
      <td>mode</td>
      <td>
        Possible values: <code>standard</code> and <code>premium</code>.
        Defaults to <code>standard</code> if omitted.
        Cannot be changed after creation.
      </td>
      <td>String</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>title</td>
      <td>Title</td>
      <td>String</td>
      <td>required</td>
    </tr>
    <tr>
      <td>external_url</td>
      <td>
        URL pointing to a HTML representation of your job offer. The HTML content of the <code>external_url</url> will be
        displayed within an <code>iframe</code> element on our website.
      </td>
      <td>String</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>description</td>
      <td>Description text of your job ad. Simple HTML tags such as <code>strong, em, u, ol, ul, li, p, br, a</code> are allowed.</td>
      <td>Text</td>
      <td>required</td>
    </tr>
    <tr>
      <td>company_description</td>
      <td>Description text of your company. Simple HTML tags such as <code>strong, em, u, ol, ul, li, p, br, a</code> are allowed.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>started_at</td>
      <td>
        Date the job offer starts being published to our platform. Note that once the job offer has
        been published this field cannot be edited any longer. If left out, we immediately publish your
        job offer.
      </td>
      <td>Datetime</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>apprenticeship_started_at</td>
      <td>Date on which the apprenticeship will start</td>
      <td>Datetime</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>ended_at</td>
      <td>Date on which the job offer stops being published to our platform.</td>
      <td>Datetime</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>trainee_gefluester</td>
      <td>
        <p>Allows co-publication a job offer on our job board TRAINEE-GEFLÜSTER by supplying <code>true</code> (valid TRAINEE-GEFLÜSTER contract required).</p>
        <p>Contact your account manager if you are interested in this service.</p>
      </td>
      <td>String</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>application_url</td>
      <td>URL pointing to the application online formular of the job offer.</td>
      <td>String</td>
      <td>optional (You need to provide either an <code>application_url</code> or an <code>application_email</code>)</td>
    </tr>
    <tr>
      <td>application_email</td>
      <td>E-Mail address potential candidates shall send their applications to</td>
      <td>String</td>
      <td>optional (You need to provide either an <code>application_url</code> or an <code>application_email</code>)</td>
    </tr>
    <tr>
      <td>job_offer_locations</td>
      <td>
        List of job_offer_location objects. Each job_offer_location contained in the list
        has to include at least a <code>city</code> and a <code>zip</code> value.
      </td>
      <td>job_offer_location object</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>use_responsive_template</td>
      <td>
        If you also submit an HTML representation of the job_offer (by submission of
        <code>external_url</code>) and if your HTML representation behaves responsive, you
        can set this attribute to <code>true</code>. In this case the iframe serving
        your HTML content will be displayed for mobile devices, too. If left out or
        set to false, we will always render a text representation of the job offer.
      </td>
      <td>Boolean</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>height</td>
      <td>Height of the iframe displaying the content of <code>external_url</code> in px.</td>
      <td>Integer</td>
      <td>optional</td>
    </tr>
  </tbody>
</table>
