## ABSOLVENTA Pull API

Our application is able to process data streams served via HTTP of different format. If you already have your
jobs wrapped into a custom data stream ready to read via HTTP, please [contact our team](mailto:api@absolventa.de) to verify
if we can handle it.

### Sample XML format

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

### Data fields

<table class='table table-bordered table-striped'>
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
      <td>
        <span class='label label-danger'>external_id</span>
      </td>
      <td>Your internal identifier of the record</td>
      <td>String</td>
      <td>required</td>
    </tr>
    <tr>
      <td>
        <span class='label label-info'>mode</span>
      </td>
      <td>
        Possible values: <code>standard</code> and <code>premium</code>.
        Defaults to <code>standard</code> if omitted.
        Cannot be changed after creation.
      </td>
      <td>String</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>
        <span class='label label-danger'>title</span>
      </td>
      <td>Title</td>
      <td>String</td>
      <td>required</td>
    </tr>
    <tr>
      <td>
        <span class='label label-info'>external_url</span>
      </td>
      <td>
        URL pointing to a HTML representation of your job offer. The HTML content of the <code>external_url</url> will be
        displayed within an <code>iframe</code> element on our website.
      </td>
      <td>String</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>
        <span class='label label-danger'>description</span>
      </td>
      <td>Description text of your job ad. Simple HTML tags such as <code>strong, em, u, ol, ul, li, p, br, a</code> are allowed.</td>
      <td>Text</td>
      <td>required</td>
    </tr>
    <tr>
      <td>
        <span class='label label-info'>company_description</span>
      </td>
      <td>Description text of your company. Simple HTML tags such as <code>strong, em, u, ol, ul, li, p, br, a</code> are allowed.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>
        <span class='label label-info'>started_at</span>
      </td>
        <td>
          Date the job offer starts being published to our platform. Note that once the job offer has
          been published this field cannot be edited any longer. If left out, we immediately publish your
          job offer.
        </td>
      <td>Datetime</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>
        <span class='label label-info'>ended_at</span>
      </td>
        <td>
          <p>
            Date on which the job offer stops being published to our platform.
          </p>
        </td>
      <td>Datetime</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>
        <span class='label label-info'>trainee_gefluester</span>
      </td>
      <td>
        <p>Allows mirroring a job offer on TRAINEE-GEFLÜSTER by supplying <code>true</code> (valid TRAINEE-GEFLÜSTER contract required).</p>
        <p>Contact your account manager to get activated for this service.</p>
      </td>
      <td>String</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>
        <span class='label label-info'>application_url</span>
      </td>
      <td>URL pointing to the application formular of the job offer.</td>
      <td>String</td>
      <td>optional (You need to provide either an <code>application_url</code> or an <code>application_email</code>)</td>
    </tr>
    <tr>
      <td>
        <span class='label label-info'>application_email</span>
      </td>
      <td>E-Mail address potential candidates shall send their applications to</td>
      <td>String</td>
      <td>optional (You need to provide either an <code>application_url</code> or an <code>application_email</code>)</td>
    </tr>
    <tr>
      <td>
        <span class='label label_info'>job_offer_locations</span>
      </td>
      <td>
        List of job_offer_location objects. Each job_offer_location contained in the list
        has to include at least a <code>city</code> and a <code>zip</code> value.
      </td>
      <td>job_offer_location object</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>
        <span class='label label-info'>use_responsive_template</span>
      </td>
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
      <td>
        <span class='label label-info'>height</span>
      </td>
      <td>Height of the iframe displaying the content of <code>external_url</code> in px.</td>
      <td>Integer</td>
      <td>optional</td>
    </tr>
  </tbody>
</table>
