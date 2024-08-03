package org.exram.tinkerpop;

import java.util.UUID;
import org.apache.tinkerpop.gremlin.tinkergraph.structure.AbstractTinkerGraph;

public class StringIdManager implements AbstractTinkerGraph.IdManager<String> 
{
    @Override
    public String getNextId(final AbstractTinkerGraph graph)
    {
        return UUID.randomUUID().toString();
    }

    @Override
    public String convert(final Object id)
    {
        if (id == null)
            return null;
        
        if (!(id instanceof String))
            throw new IllegalArgumentException("Expected an id of type String.");
        
        return (String)id;
    }

    @Override
    public boolean allow(final Object id)
    {
        return id instanceof String;
    }
}
