## PRAKTIKUM.INFO Pull API

Our application is able to process data streams served via HTTP of different format. If you already have your
jobs wrapped into a custom data stream ready to read via HTTP, please [contact our team](mailto:api@absolventa.de) to verify
if we can handle it.

### Sample XML format

Here's an ideal XML feed for our application PRAKTIKUM.INFO. If you are able to provide your job
data in this format, we can immediately configure a connection:

```XML
<?xml version='1.0' encoding='utf-8' ?>
<job_offers type='array'>
  <job_offer>
    <external_id>ABC-12345</external_id>
    <title>Praktikum Seefahrt (w/m/d)</title>

    <application_email>elaine.marley@absolventa.de</application_email>
    <application_url><![CDATA[https://www.example.com/jobs/seefahrt/apply]]></application_url>
    <started_at>2019-11-11T13:14:40+01:00</started_at>
    <ended_at>2019-11-15T23:59:59+01:00</ended_at>

    <job_offer_locations>
      <job_offer_location>
        <city>Berlin</city>
        <street>Greifswalder Straße 212</street>
        <zip>10405</zip>
        <country>Deutschland</country>
      </job_offer_location>
      <job_offer_location>
        <city>Berlin</city>
        <street>Oranienburger Straße 33</street>
        <zip>10178</zip>
        <country>Deutschland</country>
      </job_offer_location>
    </job_offer_locations>

    <description_headline>Komm' an Bord!</description_headline>
    <description>
      <![CDATA[
        <p>
          Unser renormiertes Seefahrtsunternehmen heuert verlässlich und regelmäßig die besten
          Seefrauen und -männer (w/m/d) östlich des Atlantiks an. Generationen von Seefahrtsexperten
          haben ihre Karriere mit ersten nautischen Schritten in unserem Unternehmen gestartet.
        </p>
      ]]>
    </description>

    <qualifications_headline>Du bist mutig genug, in allen Ozeanen dieser Welt zu schwimmen?</qualifications_headline>
    <qualifications>
      <![CDATA[
        <ul>
          <li>Du kannst schwimmen (Seepferdchen notwendig)</li>
          <li>Ein leichtes Schaukeln ist für dich kein Problem</li>
        </ul>
      ]]>
    </qualifications>

    <tasks_headline>Du kannst im Schlaf unter tosendem Sturm problemlos Segel setzen?</tasks_headline>
    <tasks>
      <![CDATA[
        <ul>
          <li>Du peppst die rauhen und kantigen Geschichten unserer weltweit verstreuten Mitarbeiter linguistisch gekonnt auf</li>
          <li>Dein Instikt lässt dich spielerisch prüfbare Fakten von hanebüchenem Seemannsgarn unterscheiden</li>
        </ul>
      ]]>
    </tasks>

    <benefits_headline>Bestens ausgerüstet!</benefits_headline>
    <benefits>
      <![CDATA[
        <ul>
          <li>Reise zum Ende der Welt</li>
          <li>Ein loyales Team</li>
          <li>Remote first: Wir begrüßen ausdrücklich das eigenständige, asynchrone Arbeiten in entlegenen Gegenden</li>
        </ul>
      ]]>
    </benefits>

    <company_description_headline>Unser Geschäft ist kein Voodoo!</company_description_headline>
    <company_description>
      <![CDATA[
        <p>Marley & Threepwood Ventures - Ihr Partner in Sachen Seefahrt- und Handelsbeziehungen</p>
      ]]>
    </company_description>

    <video_url><![CDATA[https://api.example.com/videos/seemannsgarn]]></video_url>
    <header_image_url><![CDATA[https://api.example.com/content/header_image.jpg]]></header_image_url>

    <contact_headline>Frag' unsere Expertin Elaine!</contact_headline>
    <contact>
      <![CDATA[
        <p>Elaine Marley</p>
        <p>elaine.marley@absolventa.de</p>
        <small>Senior Seefahrt-Personalmanagerin</small>
      ]]>
    </contact>

    <color>#efefef</color>
    <custom_company_title>Threepwood GmbH</custom_company_title>
  </job_offer>
  <job_offer>
    ...
  </job_offer>
</job_offers>
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
      <td>external_id</td>
      <td>Your internal identifier of the record</td>
      <td>String</td>
      <td>required</td>
    </tr>
    <tr>
      <td>title</td>
      <td>Title</td>
      <td>String</td>
      <td>required</td>
    </tr>
    <tr>
      <td>description_headline</td>
      <td>Headline summarizing the introductory description-content. Only allowed for <code>premium</code> job ads.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>description</td>
      <td>Description text of your job ad. Simple HTML tags such as <code>strong, em, u, ol, ul, li, p, br, a</code> are allowed.</td>
      <td>Text</td>
      <td>required</td>
    </tr>
    <tr>
      <td>company_description_headline</td>
      <td>Headline summarizing the company_description-content. Only allowed for <code>premium</code> job ads.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>company_description</td>
      <td>Description text of your company. Simple HTML tags such as <code>strong, em, u, ol, ul, li, p, br, a</code> are allowed.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>qualifications_headline</td>
      <td>Headline summarizing the introductory qualifications-content. Only allowed for <code>premium</code> job ads.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>qualifications</td>
      <td>Text summarizing the requirements of the candiates. Simple HTML tags such as <code>strong, em, u, ol, ul, li, p, br, a</code> are allowed.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>tasks_headline</td>
      <td>Headline summarizing the tasks-content. Only allowed for <code>premium</code> job ads.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>tasks</td>
      <td>Text summarizing the job tasks of the candiates. Simple HTML tags such as <code>strong, em, u, ol, ul, li, p, br, a</code> are allowed.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>benefits_headline</td>
      <td>Headline summarizing the benefits-content. Only allowed for <code>premium</code> job ads.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>benefits</td>
      <td>Text summarizing the job benefits of the candiates. Simple HTML tags such as <code>strong, em, u, ol, ul, li, p, br, a</code> are allowed.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>contact_headline</td>
      <td>Headline summarizing the contact-content. Only allowed for <code>premium</code> job ads.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>contact</td>
      <td>Text summarizing the contact information for the candiates. Simple HTML tags such as <code>strong, em, u, ol, ul, li, p, br, a</code> are allowed.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>video_url</td>
      <td>URL to embeddable video content. Only allowed for <code>premium</code> job ads.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>header_image_url</td>
      <td>URL to image that is being displayed at the top of the job ad. Only allowed for <code>premium</code> job ads.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>color</td>
      <td>Hex code for headline color. Only allowed for <code>premium</code> job ads.</td>
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
      <td>ended_at</td>
      <td>Date on which the job offer stops being published to our platform.</td>
      <td>Datetime</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>application_method</td>
      <td>Info about the application method.</td>
      <td>String</td>
      <td>required (Either <code>email</code> or <code>url</code>)</td>
    </tr>
    <tr>
      <td>application_url</td>
      <td>URL pointing to the application online formular of the job offer.</td>
      <td>String</td>
      <td>required (If application_method is set to <code>url</code>)</td>
    </tr>
    <tr>
      <td>application_email</td>
      <td>E-Mail address potential candidates shall send their applications to</td>
      <td>String</td>
      <td>required (If application_method is set to <code>email</code>)</td>
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
  </tbody>
</table>
