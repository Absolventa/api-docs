# Absolventa XML

```XML
<?xml version="1.0" encoding="UTF-8"?>
<job_offer>
  <title>Praktikum Seefahrt (w/m/d)</title>
  <mode>premium</mode>

  <application_email>elaine.marley@absolventa.de</application_email>
  <application_url><![CDATA[https://www.example.com/jobs/seefahrt/apply]]></application_url>
  <started_at>2019-11-11T13:14:40+01:00</started_at>
  <ended_at>2019-11-15T23:59:59+01:00</ended_at>

  <!--
    If the at least one of nodes <city> or <zip> (and optionally street and country) are given
    on top level (relatively to <job_offer>) like below this comment, we will
    create one <job_offer_location> object out of it that adds to the <job_offer_locations>
    list below.
  -->
  <city>Berlin</city>
  <street>Friedrichstraße 67</street>
  <zip>10318</zip>
  <country>Deutschland</country>

  <!--
    If you want to submit more than one location,
    you need to pass it explicitly as <job_offer_locations> list.
    If you have specified both, one location by top-level nodes
    like above these lines and locations list like below this comment
    using the node <job_offer_locations>, we will add them together.
  -->
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

  <!-- These XML fields are deprecated -->
  <external_url><![CDATA[https://www.example.com/jobs/seefahrt]]></external_url>
  <use_responsive_template>true</use_responsive_template>
  <height>1234</height>

  <contact_name>Elaine Marley</contact_name>
  <contact_email>elaine.marley@absolventa.de</contact_email>
  <contact_phone>+49 0123456</contact_phone>
  <contact_position>Recruiter</contact_position>
</job_offer>
```

### Data fields

#### HTML tags

Some text fields allow passing HTML tags. However, to guarantee a good interplay with our
native UI, not all HTML tags are allowed. The following tags are allowed: <code>strong, em, u, ol, ul, li, p, br, a</code>.
All other HTML tags will get stripped out automatically. Some HTML tags make use of attributes. We allow the following
attributes: <code>href, class, target</code>. All other attributes will get stripped out automatically.

#### List of fields

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
        Possible values: <code>standard</code>. <code>premium</code> and <code>premium_plus</code>.
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
      <td>description_headline</td>
      <td>Headline summarizing the introductory description-content. Only allowed for <code>premium</code> or <code>premium_plus</code> job ads.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>description</td>
      <td>Description text of your job ad.</td>
      <td>Text/HTML</td>
      <td>required</td>
    </tr>
    <tr>
      <td>company_description_headline</td>
      <td>Headline summarizing the company_description-content.</td>
      <td>Text/HTML</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>company_description</td>
      <td>Description text of your company.</td>
      <td>Text/HTML</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>qualifications_headline</td>
      <td>Headline summarizing the introductory qualifications-content. Only allowed for <code>premium</code> or <code>premium_plus</code> job ads.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>qualifications</td>
      <td>Text summarizing the requirements of the candiates.</td>
      <td>Text/HTML</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>tasks_headline</td>
      <td>Headline summarizing the tasks-content. Only allowed for <code>premium</code> or <code>premium_plus</code> job ads.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>tasks</td>
      <td>Text summarizing the job tasks of the candiates.</td>
      <td>Text/HTML</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>benefits_headline</td>
      <td>Headline summarizing the benefits-content. Only allowed for <code>premium</code> or <code>premium_plus</code> job ads.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>benefits</td>
      <td>Text summarizing the job benefits of the candiates.</td>
      <td>Text/HTML</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>contact_headline</td>
      <td>Headline summarizing the contact-content. Only allowed for <code>premium</code> or <code>premium_plus</code> job ads.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>contact</td>
      <td>Text summarizing the contact information for the candiates.</td>
      <td>Text/HTML</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>video_url</td>
      <td>URL to embeddable video content. Only allowed for <code>premium</code> or <code>premium_plus</code> job ads.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>header_image_url</td>
      <td>URL to image that is being displayed at the top of the job ad. Only allowed for <code>premium</code> or <code>premium_plus</code> job ads.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>color</td>
      <td>Hex code for headline color. Only allowed for <code>premium</code> or <code>premium_plus</code> job ads.</td>
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
      <td>Date on which the apprenticeship will start. Only relevant for job ads targeted at https://www.azubi.de.</td>
      <td>Datetime</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>ended_at</td>
      <td>
        Date on which the job offer stops being published to our platform. If not specified, we will
        compute and assign the latest point in time that is allowed w.r.t to your contract and the upper bound.
        The upper bound for a job offer's runtime of 36 month, so the <code>ended_at</code> value is allowed
        to be maximal 36 month after the <code>started_at</code> value, regardless of type of job offer and type
        of your contract.

        Also note that updating the ended_at value is possibly restricted, depending on the <code>mode</code> value.
        If your job offer has mode <code>premium</code> or <code>premium_plus</code>, then editing
        the ended_at directly is not allowed after publication.

        The only way of modifying the runtime then is by using the HTTP PUT endpoints for prolongation or ending (quit).
      </td>
      <td>Datetime</td>
      <td>optional - we will auto-assign this value if left out and determine the latest possible value.</td>
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
      <td>praktikum_info</td>
      <td>
        <p>Allows co-publication a job offer on our job board PRAKTIKUM.INFO by supplying <code>true</code> (valid PRAKTIKUM.INFO contract required).</p>
        <p>Contact your account manager if you are interested in this service.</p>
      </td>
      <td>String</td>
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
